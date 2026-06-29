#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global GDIP_EMFPLUS_RECORD_BASE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global GDIP_WMF_RECORD_BASE := 65536

/**
 * @type {Guid}
 */
export global ImageFormatUndefined := Guid("{b96b3ca9-0728-11d3-9d7b-0000f81ef32e}")

/**
 * @type {Guid}
 */
export global ImageFormatMemoryBMP := Guid("{b96b3caa-0728-11d3-9d7b-0000f81ef32e}")

/**
 * @type {Guid}
 */
export global ImageFormatBMP := Guid("{b96b3cab-0728-11d3-9d7b-0000f81ef32e}")

/**
 * @type {Guid}
 */
export global ImageFormatEMF := Guid("{b96b3cac-0728-11d3-9d7b-0000f81ef32e}")

/**
 * @type {Guid}
 */
export global ImageFormatWMF := Guid("{b96b3cad-0728-11d3-9d7b-0000f81ef32e}")

/**
 * @type {Guid}
 */
export global ImageFormatJPEG := Guid("{b96b3cae-0728-11d3-9d7b-0000f81ef32e}")

/**
 * @type {Guid}
 */
export global ImageFormatPNG := Guid("{b96b3caf-0728-11d3-9d7b-0000f81ef32e}")

/**
 * @type {Guid}
 */
export global ImageFormatGIF := Guid("{b96b3cb0-0728-11d3-9d7b-0000f81ef32e}")

/**
 * @type {Guid}
 */
export global ImageFormatTIFF := Guid("{b96b3cb1-0728-11d3-9d7b-0000f81ef32e}")

/**
 * @type {Guid}
 */
export global ImageFormatEXIF := Guid("{b96b3cb2-0728-11d3-9d7b-0000f81ef32e}")

/**
 * @type {Guid}
 */
export global ImageFormatIcon := Guid("{b96b3cb5-0728-11d3-9d7b-0000f81ef32e}")

/**
 * @type {Guid}
 */
export global ImageFormatHEIF := Guid("{b96b3cb6-0728-11d3-9d7b-0000f81ef32e}")

/**
 * @type {Guid}
 */
export global ImageFormatWEBP := Guid("{b96b3cb7-0728-11d3-9d7b-0000f81ef32e}")

/**
 * @type {Guid}
 */
export global FrameDimensionTime := Guid("{6aedbd6d-3fb5-418a-83a6-7f45229dc872}")

/**
 * @type {Guid}
 */
export global FrameDimensionResolution := Guid("{84236f7b-3bd3-428f-8dab-4ea1439ca315}")

/**
 * @type {Guid}
 */
export global FrameDimensionPage := Guid("{7462dc86-6180-4c7e-8e3f-ee7333a7a483}")

/**
 * @type {Guid}
 */
export global FormatIDImageInformation := Guid("{e5836cbe-5eef-4f1d-acde-ae4c43b608ce}")

/**
 * @type {Guid}
 */
export global FormatIDJpegAppHeaders := Guid("{1c4afdcd-6177-43cf-abc7-5f51af39ee85}")

/**
 * @type {Guid}
 */
export global EncoderCompression := Guid("{e09d739d-ccd4-44ee-8eba-3fbf8be4fc58}")

/**
 * @type {Guid}
 */
export global EncoderColorDepth := Guid("{66087055-ad66-4c7c-9a18-38a2310b8337}")

/**
 * @type {Guid}
 */
export global EncoderScanMethod := Guid("{3a4e2661-3109-4e56-8536-42c156e7dcfa}")

/**
 * @type {Guid}
 */
export global EncoderVersion := Guid("{24d18c76-814a-41a4-bf53-1c219cccf797}")

/**
 * @type {Guid}
 */
export global EncoderRenderMethod := Guid("{6d42c53a-229a-4825-8bb7-5c99e2b9a8b8}")

/**
 * @type {Guid}
 */
export global EncoderQuality := Guid("{1d5be4b5-fa4a-452d-9cdd-5db35105e7eb}")

/**
 * @type {Guid}
 */
export global EncoderTransformation := Guid("{8d0eb2d1-a58e-4ea8-aa14-108074b7b6f9}")

/**
 * @type {Guid}
 */
export global EncoderLuminanceTable := Guid("{edb33bce-0266-4a77-b904-27216099e717}")

/**
 * @type {Guid}
 */
export global EncoderChrominanceTable := Guid("{f2e455dc-09b3-4316-8260-676ada32481c}")

/**
 * @type {Guid}
 */
export global EncoderSaveFlag := Guid("{292266fc-ac40-47bf-8cfc-a85b89a655de}")

/**
 * @type {Guid}
 */
export global EncoderColorSpace := Guid("{ae7a62a0-ee2c-49d8-9d07-1ba8a927596e}")

/**
 * @type {Guid}
 */
export global EncoderImageItems := Guid("{63875e13-1f1d-45ab-9195-a29b6066a650}")

/**
 * @type {Guid}
 */
export global EncoderSaveAsCMYK := Guid("{a219bbc9-0a9d-4005-a3ee-3a421b8bb06c}")

/**
 * @type {Guid}
 */
export global CodecIImageBytes := Guid("{025d1823-6c7d-447b-bbdb-a3cbc3dfa2fc}")

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagTypeByte := 1

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagTypeASCII := 2

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagTypeShort := 3

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagTypeLong := 4

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagTypeRational := 5

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagTypeUndefined := 7

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagTypeSLONG := 9

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagTypeSRational := 10

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifIFD := 34665

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsIFD := 34853

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagNewSubfileType := 254

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagSubfileType := 255

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagImageWidth := 256

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagImageHeight := 257

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagBitsPerSample := 258

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagCompression := 259

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagPhotometricInterp := 262

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThreshHolding := 263

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagCellWidth := 264

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagCellHeight := 265

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagFillOrder := 266

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagDocumentName := 269

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagImageDescription := 270

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagEquipMake := 271

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagEquipModel := 272

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagStripOffsets := 273

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagOrientation := 274

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagSamplesPerPixel := 277

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagRowsPerStrip := 278

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagStripBytesCount := 279

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagMinSampleValue := 280

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagMaxSampleValue := 281

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagXResolution := 282

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagYResolution := 283

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagPlanarConfig := 284

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagPageName := 285

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagXPosition := 286

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagYPosition := 287

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagFreeOffset := 288

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagFreeByteCounts := 289

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGrayResponseUnit := 290

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGrayResponseCurve := 291

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagT4Option := 292

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagT6Option := 293

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagResolutionUnit := 296

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagPageNumber := 297

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagTransferFuncition := 301

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagSoftwareUsed := 305

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagDateTime := 306

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagArtist := 315

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagHostComputer := 316

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagPredictor := 317

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagWhitePoint := 318

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagPrimaryChromaticities := 319

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagColorMap := 320

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagHalftoneHints := 321

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagTileWidth := 322

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagTileLength := 323

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagTileOffset := 324

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagTileByteCounts := 325

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagInkSet := 332

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagInkNames := 333

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagNumberOfInks := 334

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagDotRange := 336

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagTargetPrinter := 337

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExtraSamples := 338

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagSampleFormat := 339

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagSMinSampleValue := 340

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagSMaxSampleValue := 341

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagTransferRange := 342

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagJPEGProc := 512

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagJPEGInterFormat := 513

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagJPEGInterLength := 514

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagJPEGRestartInterval := 515

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagJPEGLosslessPredictors := 517

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagJPEGPointTransforms := 518

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagJPEGQTables := 519

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagJPEGDCTables := 520

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagJPEGACTables := 521

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagYCbCrCoefficients := 529

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagYCbCrSubsampling := 530

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagYCbCrPositioning := 531

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagREFBlackWhite := 532

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagICCProfile := 34675

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGamma := 769

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagICCProfileDescriptor := 770

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagSRGBRenderingIntent := 771

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagImageTitle := 800

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagCopyright := 33432

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagResolutionXUnit := 20481

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagResolutionYUnit := 20482

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagResolutionXLengthUnit := 20483

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagResolutionYLengthUnit := 20484

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagPrintFlags := 20485

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagPrintFlagsVersion := 20486

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagPrintFlagsCrop := 20487

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagPrintFlagsBleedWidth := 20488

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagPrintFlagsBleedWidthScale := 20489

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagHalftoneLPI := 20490

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagHalftoneLPIUnit := 20491

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagHalftoneDegree := 20492

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagHalftoneShape := 20493

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagHalftoneMisc := 20494

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagHalftoneScreen := 20495

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagJPEGQuality := 20496

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGridSize := 20497

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailFormat := 20498

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailWidth := 20499

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailHeight := 20500

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailColorDepth := 20501

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailPlanes := 20502

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailRawBytes := 20503

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailSize := 20504

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailCompressedSize := 20505

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagColorTransferFunction := 20506

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailData := 20507

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailImageWidth := 20512

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailImageHeight := 20513

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailBitsPerSample := 20514

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailCompression := 20515

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailPhotometricInterp := 20516

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailImageDescription := 20517

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailEquipMake := 20518

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailEquipModel := 20519

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailStripOffsets := 20520

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailOrientation := 20521

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailSamplesPerPixel := 20522

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailRowsPerStrip := 20523

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailStripBytesCount := 20524

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailResolutionX := 20525

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailResolutionY := 20526

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailPlanarConfig := 20527

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailResolutionUnit := 20528

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailTransferFunction := 20529

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailSoftwareUsed := 20530

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailDateTime := 20531

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailArtist := 20532

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailWhitePoint := 20533

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailPrimaryChromaticities := 20534

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailYCbCrCoefficients := 20535

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailYCbCrSubsampling := 20536

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailYCbCrPositioning := 20537

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailRefBlackWhite := 20538

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagThumbnailCopyRight := 20539

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagLuminanceTable := 20624

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagChrominanceTable := 20625

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagFrameDelay := 20736

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagLoopCount := 20737

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGlobalPalette := 20738

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagIndexBackground := 20739

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagIndexTransparent := 20740

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagPixelUnit := 20752

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagPixelPerUnitX := 20753

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagPixelPerUnitY := 20754

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagPaletteHistogram := 20755

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifExposureTime := 33434

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifFNumber := 33437

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifExposureProg := 34850

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifSpectralSense := 34852

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifISOSpeed := 34855

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifOECF := 34856

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifVer := 36864

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifDTOrig := 36867

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifDTDigitized := 36868

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifCompConfig := 37121

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifCompBPP := 37122

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifShutterSpeed := 37377

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifAperture := 37378

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifBrightness := 37379

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifExposureBias := 37380

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifMaxAperture := 37381

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifSubjectDist := 37382

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifMeteringMode := 37383

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifLightSource := 37384

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifFlash := 37385

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifFocalLength := 37386

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifSubjectArea := 37396

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifMakerNote := 37500

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifUserComment := 37510

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifDTSubsec := 37520

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifDTOrigSS := 37521

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifDTDigSS := 37522

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifFPXVer := 40960

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifColorSpace := 40961

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifPixXDim := 40962

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifPixYDim := 40963

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifRelatedWav := 40964

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifInterop := 40965

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifFlashEnergy := 41483

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifSpatialFR := 41484

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifFocalXRes := 41486

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifFocalYRes := 41487

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifFocalResUnit := 41488

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifSubjectLoc := 41492

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifExposureIndex := 41493

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifSensingMethod := 41495

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifFileSource := 41728

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifSceneType := 41729

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifCfaPattern := 41730

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifCustomRendered := 41985

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifExposureMode := 41986

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifWhiteBalance := 41987

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifDigitalZoomRatio := 41988

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifFocalLengthIn35mmFilm := 41989

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifSceneCaptureType := 41990

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifGainControl := 41991

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifContrast := 41992

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifSaturation := 41993

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifSharpness := 41994

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifDeviceSettingDesc := 41995

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifSubjectDistanceRange := 41996

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagExifUniqueImageID := 42016

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsVer := 0

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsLatitudeRef := 1

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsLatitude := 2

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsLongitudeRef := 3

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsLongitude := 4

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsAltitudeRef := 5

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsAltitude := 6

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsGpsTime := 7

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsGpsSatellites := 8

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsGpsStatus := 9

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsGpsMeasureMode := 10

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsGpsDop := 11

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsSpeedRef := 12

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsSpeed := 13

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsTrackRef := 14

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsTrack := 15

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsImgDirRef := 16

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsImgDir := 17

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsMapDatum := 18

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsDestLatRef := 19

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsDestLat := 20

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsDestLongRef := 21

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsDestLong := 22

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsDestBearRef := 23

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsDestBear := 24

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsDestDistRef := 25

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsDestDist := 26

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsProcessingMethod := 27

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsAreaInformation := 28

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsDate := 29

/**
 * @type {Integer (UInt32)}
 */
export global PropertyTagGpsDifferential := 30

/**
 * @type {Integer (UInt32)}
 */
export global GDIP_EMFPLUSFLAGS_DISPLAY := 1

/**
 * @type {Integer (UInt32)}
 */
export global ALPHA_SHIFT := 24

/**
 * @type {Integer (UInt32)}
 */
export global RED_SHIFT := 16

/**
 * @type {Integer (UInt32)}
 */
export global GREEN_SHIFT := 8

/**
 * @type {Integer (UInt32)}
 */
export global BLUE_SHIFT := 0

/**
 * @type {Integer (UInt32)}
 */
export global PixelFormatIndexed := 65536

/**
 * @type {Integer (UInt32)}
 */
export global PixelFormatGDI := 131072

/**
 * @type {Integer (UInt32)}
 */
export global PixelFormatAlpha := 262144

/**
 * @type {Integer (UInt32)}
 */
export global PixelFormatPAlpha := 524288

/**
 * @type {Integer (UInt32)}
 */
export global PixelFormatExtended := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global PixelFormatCanonical := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global PixelFormatUndefined := 0

/**
 * @type {Integer (UInt32)}
 */
export global PixelFormatDontCare := 0

/**
 * @type {Integer (UInt32)}
 */
export global PixelFormatMax := 16

/**
 * @type {Float}
 */
export global FlatnessDefault := 0.25

/**
 * @type {Guid}
 */
export global BlurEffectGuid := Guid("{633c80a4-1843-482b-9ef2-be2834c5fdd4}")

/**
 * @type {Guid}
 */
export global SharpenEffectGuid := Guid("{63cbf3ee-c526-402c-8f71-62c540bf5142}")

/**
 * @type {Guid}
 */
export global ColorMatrixEffectGuid := Guid("{718f2615-7933-40e3-a511-5f68fe14dd74}")

/**
 * @type {Guid}
 */
export global ColorLUTEffectGuid := Guid("{a7ce72a9-0f7f-40d7-b3cc-d0c02d5c3212}")

/**
 * @type {Guid}
 */
export global BrightnessContrastEffectGuid := Guid("{d3a1dbe1-8ec4-4c17-9f4c-ea97ad1c343d}")

/**
 * @type {Guid}
 */
export global HueSaturationLightnessEffectGuid := Guid("{8b2dd6c3-eb07-4d87-a5f0-7108e26a9c5f}")

/**
 * @type {Guid}
 */
export global LevelsEffectGuid := Guid("{99c354ec-2a31-4f3a-8c34-17a803b33a25}")

/**
 * @type {Guid}
 */
export global TintEffectGuid := Guid("{1077af00-2848-4441-9489-44ad4c2d7a2c}")

/**
 * @type {Guid}
 */
export global ColorBalanceEffectGuid := Guid("{537e597d-251e-48da-9664-29ca496b70f8}")

/**
 * @type {Guid}
 */
export global RedEyeCorrectionEffectGuid := Guid("{74d29d05-69a4-4266-9549-3cc52836b632}")

/**
 * @type {Guid}
 */
export global ColorCurveEffectGuid := Guid("{dd6a0022-58e4-4a67-9d9b-d48eb881a53d}")
;@endregion Constants
