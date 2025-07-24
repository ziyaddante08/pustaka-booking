<?php
defined('BASEPATH') or exit('No Direct script access allowed');
date_default_timezone_set('Asia/Jakarta');

class Laporan extends CI_Controller {

    public function laporan_buku()
    {
        $data['judul'] = 'Laporan Data Buku';
        $data['user'] = $this->ModelUser->cekData(['email' => $this->session->userdata('email')])->row_array();
        $data['buku'] = $this->ModelBuku->getBuku()->result_array();
        $data['kategori'] = $this->ModelBuku->getKategori()->result_array();
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('buku/laporan_buku', $data);
        $this->load->view('templates/footer');
    }

    public function cetak_laporan_buku()
    {
        $data['buku'] = $this->ModelBuku->getBuku()->result_array();
        $data['kategori'] = $this->ModelBuku->getKategori()->result_Array();

        $this->load->view('buku/laporan_print_buku', $data);
    }

    public function laporan_buku_pdf()
    {
        $this->load->library('dompdf_gen');

        $data['buku'] = $this->ModelBuku->getBuku()->result_array();

        $this->load->view('buku/laporan_pdf_buku', $data);

        $paper_size = 'A4'; // ukuran kertas
        $orientation = 'landscape'; //orientasi
        $html = $this->output->get_output();

    
        $this->dompdf->set_paper($paper_size, $orientation);
        //Convert to PDF
        $this->dompdf->load_html($html);
        $this->dompdf->render();
        $this->dompdf->stream("laporan_data_buku.pdf", array('Attachment' => 0));
        // nama file pdf yang dihasilkan
    }

    public function export_excel()
    {
        $data = ['title' => 'Laporan Buku',
                'buku' => $this->ModelBuku->getBuku()->result_array()];
        $this->load->view('buku/export_excel_buku', $data);
    }

    public function laporan_pinjam()
	{
		$data = array(
			'judul' => 'Laporan Data Peminjaman',
			'user' => $this->ModelUser->cekData(['email' => $this->session->userdata('email')])->row_array(),
			'laporan' => $this->db->query(
				'SELECT * FROM pinjam p, detail_pinjam d, buku b, user u WHERE d.id_buku=b.id AND p.id_user=u.id AND p.no_pinjam=d.no_pinjam'
			)->result_array()
		);

		$this->load->view('templates/header', $data);
		$this->load->view('templates/sidebar');
		$this->load->view('templates/topbar', $data);
		$this->load->view('pinjam/laporan-pinjam', $data);
		$this->load->view('templates/footer');
	}

	public function cetak_laporan_pinjam()
	{
		$data['laporan'] = $this->db->query(
			"SELECT * FROM pinjam p,detail_pinjam d, buku b,user u WHERE d.id_buku=b.id AND p.id_user=u.id AND p.no_pinjam=d.no_pinjam"
		)->result_array();
		
		$this->load->view('pinjam/laporan-print-pinjam', $data);
	}

	public function laporan_pinjam_pdf()
	{
		$this->load->library('Dompdf_gen');
		
		$data['laporan'] = $this->db->query(
			"SELECT * FROM pinjam p,detail_pinjam d, buku b,user u WHERE d.id_buku=b.id AND p.id_user=u.id AND p.no_pinjam=d.no_pinjam"
		)->result_array();
		
		$this->load->view('pinjam/laporan-pdf-pinjam', $data);
		
		$paper = 'A4';
		$orien = 'landscape';
		$html = $this->output->get_output();
		
		$this->dompdf->set_paper($paper, $orien);
		$this->dompdf->load_html($html);
		$this->dompdf->render();
		$this->dompdf->stream("laporan data peminjaman.pdf");
	}

	public function export_excel_pinjam()
	{
		$data = array(
			'title' => 'Laporan Data Peminjaman Buku',
			'laporan' => $this->db->query("SELECT * FROM pinjam p,detail_pinjam d, buku b,user u WHERE d.id_buku=b.id AND p.id_user=u.id AND p.no_pinjam=d.no_pinjam")->result_array()
		);
		$this->load->view('pinjam/export-excel-pinjam', $data);
	}

    public function laporan_anggota(){
        $data['judul'] = 'Laporan Data Anggota';
        $data['user'] = $this->ModelUser->cekData(['email' => $this->session->userdata('email')])->row_array();
        $data['laporan'] = $this->db->query("SELECT id, nama, alamat, email, image, tanggal_input FROM user WHERE role_id=2")->result_array();
        
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('member/laporan-anggota', $data);
        $this->load->view('templates/footer');
    }
    
    public function cetak_laporan_anggota()
    {
        $data['laporan'] = $this->db->query("SELECT id, nama, alamat, email, image, tanggal_input FROM user WHERE role_id=2")->result_array();
        
        $this->load->view('member/laporan-print-anggota', $data);
    }
    
    public function laporan_anggota_pdf()
    {
        $this->load->library('Dompdf_gen');
		
		$data['laporan'] = $this->db->query("SELECT id, nama, alamat, email, image, tanggal_input FROM user WHERE role_id=2"
		)->result_array();
		
		$this->load->view('member/laporan-pdf-anggota', $data);
		
		$paper = 'A4';
		$orien = 'landscape';
		$html = $this->output->get_output();
		
		$this->dompdf->set_paper($paper, $orien);
		$this->dompdf->load_html($html);
		$this->dompdf->render();
		$this->dompdf->stream("laporan data anggota.pdf");
    }
    public function export_excel_anggota()
    {
        $data = array( 'title' => 'Laporan Data Anggota','laporan' => $this->db->query("SELECT id, nama, alamat, email, image, tanggal_input FROM user WHERE role_id=2")->result_array());
        $this->load->view('member/export-excel-anggota', $data);
    }
}