//
//  TotalDaily.swift
//  iOSAssignment
//
//  Created by Nour_Madar on 19/05/2022.
//
import Foundation

struct TotalDaily : Codable {

	let cA : CA?
	let cHOCDF : CA?
	let cHOLE : CA?
	let eNERCKCAL : CA?
	let fASAT : CA?
	let fAT : CA?
	let fE : CA?
	let fIBTG : CA?
	let fOLDFE : CA?
	let k : CA?
	let mG : CA?
	let nA : CA?
	let nIA : CA?
	let p : CA?
	let pROCNT : CA?
	let rIBF : CA?
	let tHIA : CA?
	let tOCPHA : CA?
	let vITARAE : CA?
	let vITB12 : CA?
	let vITB6A : CA?
	let vITC : CA?
	let vITD : CA?
	let vITK1 : CA?
	let zN : CA?


	enum CodingKeys: String, CodingKey {
		case cA
		case cHOCDF
		case cHOLE
		case eNERCKCAL
		case fASAT
		case fAT
		case fE
		case fIBTG
		case fOLDFE
		case k
		case mG
		case nA
		case nIA
		case p
		case pROCNT
		case rIBF
		case tHIA
		case tOCPHA
		case vITARAE
		case vITB12
		case vITB6A
		case vITC
		case vITD
		case vITK1
		case zN
	}
	init(from decoder: Decoder) throws {
		
		cA = try CA(from: decoder)
		cHOCDF = try CA(from: decoder)
		cHOLE = try CA(from: decoder)
		eNERCKCAL = try CA(from: decoder)
		fASAT = try CA(from: decoder)
		fAT = try CA(from: decoder)
		fE = try CA(from: decoder)
		fIBTG = try CA(from: decoder)
		fOLDFE = try CA(from: decoder)
		k = try CA(from: decoder)
		mG = try CA(from: decoder)
		nA = try CA(from: decoder)
		nIA = try CA(from: decoder)
		p = try CA(from: decoder)
		pROCNT = try CA(from: decoder)
		rIBF = try CA(from: decoder)
		tHIA = try CA(from: decoder)
		tOCPHA = try CA(from: decoder)
		vITARAE = try CA(from: decoder)
		vITB12 = try CA(from: decoder)
		vITB6A = try CA(from: decoder)
		vITC = try CA(from: decoder)
		vITD = try CA(from: decoder)
		vITK1 = try CA(from: decoder)
		zN = try CA(from: decoder)
	}


}
