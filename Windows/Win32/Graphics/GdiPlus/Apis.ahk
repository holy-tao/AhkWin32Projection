#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\Gdi\HPALETTE.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class GdiPlus {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static GDIP_EMFPLUS_RECORD_BASE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static GDIP_WMF_RECORD_BASE => 65536

    /**
     * @type {String}
     */
    static ImageFormatUndefined => "{b96b3ca9-0728-11d3-9d7b-0000f81ef32e}"

    /**
     * @type {String}
     */
    static ImageFormatMemoryBMP => "{b96b3caa-0728-11d3-9d7b-0000f81ef32e}"

    /**
     * @type {String}
     */
    static ImageFormatBMP => "{b96b3cab-0728-11d3-9d7b-0000f81ef32e}"

    /**
     * @type {String}
     */
    static ImageFormatEMF => "{b96b3cac-0728-11d3-9d7b-0000f81ef32e}"

    /**
     * @type {String}
     */
    static ImageFormatWMF => "{b96b3cad-0728-11d3-9d7b-0000f81ef32e}"

    /**
     * @type {String}
     */
    static ImageFormatJPEG => "{b96b3cae-0728-11d3-9d7b-0000f81ef32e}"

    /**
     * @type {String}
     */
    static ImageFormatPNG => "{b96b3caf-0728-11d3-9d7b-0000f81ef32e}"

    /**
     * @type {String}
     */
    static ImageFormatGIF => "{b96b3cb0-0728-11d3-9d7b-0000f81ef32e}"

    /**
     * @type {String}
     */
    static ImageFormatTIFF => "{b96b3cb1-0728-11d3-9d7b-0000f81ef32e}"

    /**
     * @type {String}
     */
    static ImageFormatEXIF => "{b96b3cb2-0728-11d3-9d7b-0000f81ef32e}"

    /**
     * @type {String}
     */
    static ImageFormatIcon => "{b96b3cb5-0728-11d3-9d7b-0000f81ef32e}"

    /**
     * @type {String}
     */
    static ImageFormatHEIF => "{b96b3cb6-0728-11d3-9d7b-0000f81ef32e}"

    /**
     * @type {String}
     */
    static ImageFormatWEBP => "{b96b3cb7-0728-11d3-9d7b-0000f81ef32e}"

    /**
     * @type {String}
     */
    static FrameDimensionTime => "{6aedbd6d-3fb5-418a-83a6-7f45229dc872}"

    /**
     * @type {String}
     */
    static FrameDimensionResolution => "{84236f7b-3bd3-428f-8dab-4ea1439ca315}"

    /**
     * @type {String}
     */
    static FrameDimensionPage => "{7462dc86-6180-4c7e-8e3f-ee7333a7a483}"

    /**
     * @type {String}
     */
    static FormatIDImageInformation => "{e5836cbe-5eef-4f1d-acde-ae4c43b608ce}"

    /**
     * @type {String}
     */
    static FormatIDJpegAppHeaders => "{1c4afdcd-6177-43cf-abc7-5f51af39ee85}"

    /**
     * @type {String}
     */
    static EncoderCompression => "{e09d739d-ccd4-44ee-8eba-3fbf8be4fc58}"

    /**
     * @type {String}
     */
    static EncoderColorDepth => "{66087055-ad66-4c7c-9a18-38a2310b8337}"

    /**
     * @type {String}
     */
    static EncoderScanMethod => "{3a4e2661-3109-4e56-8536-42c156e7dcfa}"

    /**
     * @type {String}
     */
    static EncoderVersion => "{24d18c76-814a-41a4-bf53-1c219cccf797}"

    /**
     * @type {String}
     */
    static EncoderRenderMethod => "{6d42c53a-229a-4825-8bb7-5c99e2b9a8b8}"

    /**
     * @type {String}
     */
    static EncoderQuality => "{1d5be4b5-fa4a-452d-9cdd-5db35105e7eb}"

    /**
     * @type {String}
     */
    static EncoderTransformation => "{8d0eb2d1-a58e-4ea8-aa14-108074b7b6f9}"

    /**
     * @type {String}
     */
    static EncoderLuminanceTable => "{edb33bce-0266-4a77-b904-27216099e717}"

    /**
     * @type {String}
     */
    static EncoderChrominanceTable => "{f2e455dc-09b3-4316-8260-676ada32481c}"

    /**
     * @type {String}
     */
    static EncoderSaveFlag => "{292266fc-ac40-47bf-8cfc-a85b89a655de}"

    /**
     * @type {String}
     */
    static EncoderColorSpace => "{ae7a62a0-ee2c-49d8-9d07-1ba8a927596e}"

    /**
     * @type {String}
     */
    static EncoderImageItems => "{63875e13-1f1d-45ab-9195-a29b6066a650}"

    /**
     * @type {String}
     */
    static EncoderSaveAsCMYK => "{a219bbc9-0a9d-4005-a3ee-3a421b8bb06c}"

    /**
     * @type {String}
     */
    static CodecIImageBytes => "{025d1823-6c7d-447b-bbdb-a3cbc3dfa2fc}"

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagTypeByte => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagTypeASCII => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagTypeShort => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagTypeLong => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagTypeRational => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagTypeUndefined => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagTypeSLONG => 9

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagTypeSRational => 10

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifIFD => 34665

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsIFD => 34853

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagNewSubfileType => 254

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagSubfileType => 255

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagImageWidth => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagImageHeight => 257

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagBitsPerSample => 258

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagCompression => 259

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagPhotometricInterp => 262

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThreshHolding => 263

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagCellWidth => 264

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagCellHeight => 265

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagFillOrder => 266

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagDocumentName => 269

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagImageDescription => 270

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagEquipMake => 271

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagEquipModel => 272

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagStripOffsets => 273

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagOrientation => 274

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagSamplesPerPixel => 277

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagRowsPerStrip => 278

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagStripBytesCount => 279

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagMinSampleValue => 280

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagMaxSampleValue => 281

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagXResolution => 282

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagYResolution => 283

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagPlanarConfig => 284

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagPageName => 285

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagXPosition => 286

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagYPosition => 287

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagFreeOffset => 288

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagFreeByteCounts => 289

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGrayResponseUnit => 290

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGrayResponseCurve => 291

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagT4Option => 292

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagT6Option => 293

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagResolutionUnit => 296

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagPageNumber => 297

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagTransferFuncition => 301

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagSoftwareUsed => 305

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagDateTime => 306

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagArtist => 315

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagHostComputer => 316

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagPredictor => 317

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagWhitePoint => 318

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagPrimaryChromaticities => 319

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagColorMap => 320

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagHalftoneHints => 321

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagTileWidth => 322

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagTileLength => 323

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagTileOffset => 324

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagTileByteCounts => 325

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagInkSet => 332

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagInkNames => 333

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagNumberOfInks => 334

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagDotRange => 336

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagTargetPrinter => 337

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExtraSamples => 338

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagSampleFormat => 339

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagSMinSampleValue => 340

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagSMaxSampleValue => 341

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagTransferRange => 342

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagJPEGProc => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagJPEGInterFormat => 513

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagJPEGInterLength => 514

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagJPEGRestartInterval => 515

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagJPEGLosslessPredictors => 517

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagJPEGPointTransforms => 518

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagJPEGQTables => 519

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagJPEGDCTables => 520

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagJPEGACTables => 521

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagYCbCrCoefficients => 529

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagYCbCrSubsampling => 530

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagYCbCrPositioning => 531

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagREFBlackWhite => 532

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagICCProfile => 34675

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGamma => 769

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagICCProfileDescriptor => 770

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagSRGBRenderingIntent => 771

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagImageTitle => 800

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagCopyright => 33432

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagResolutionXUnit => 20481

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagResolutionYUnit => 20482

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagResolutionXLengthUnit => 20483

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagResolutionYLengthUnit => 20484

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagPrintFlags => 20485

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagPrintFlagsVersion => 20486

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagPrintFlagsCrop => 20487

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagPrintFlagsBleedWidth => 20488

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagPrintFlagsBleedWidthScale => 20489

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagHalftoneLPI => 20490

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagHalftoneLPIUnit => 20491

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagHalftoneDegree => 20492

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagHalftoneShape => 20493

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagHalftoneMisc => 20494

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagHalftoneScreen => 20495

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagJPEGQuality => 20496

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGridSize => 20497

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailFormat => 20498

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailWidth => 20499

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailHeight => 20500

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailColorDepth => 20501

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailPlanes => 20502

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailRawBytes => 20503

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailSize => 20504

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailCompressedSize => 20505

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagColorTransferFunction => 20506

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailData => 20507

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailImageWidth => 20512

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailImageHeight => 20513

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailBitsPerSample => 20514

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailCompression => 20515

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailPhotometricInterp => 20516

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailImageDescription => 20517

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailEquipMake => 20518

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailEquipModel => 20519

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailStripOffsets => 20520

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailOrientation => 20521

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailSamplesPerPixel => 20522

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailRowsPerStrip => 20523

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailStripBytesCount => 20524

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailResolutionX => 20525

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailResolutionY => 20526

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailPlanarConfig => 20527

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailResolutionUnit => 20528

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailTransferFunction => 20529

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailSoftwareUsed => 20530

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailDateTime => 20531

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailArtist => 20532

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailWhitePoint => 20533

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailPrimaryChromaticities => 20534

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailYCbCrCoefficients => 20535

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailYCbCrSubsampling => 20536

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailYCbCrPositioning => 20537

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailRefBlackWhite => 20538

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagThumbnailCopyRight => 20539

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagLuminanceTable => 20624

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagChrominanceTable => 20625

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagFrameDelay => 20736

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagLoopCount => 20737

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGlobalPalette => 20738

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagIndexBackground => 20739

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagIndexTransparent => 20740

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagPixelUnit => 20752

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagPixelPerUnitX => 20753

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagPixelPerUnitY => 20754

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagPaletteHistogram => 20755

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifExposureTime => 33434

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifFNumber => 33437

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifExposureProg => 34850

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifSpectralSense => 34852

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifISOSpeed => 34855

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifOECF => 34856

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifVer => 36864

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifDTOrig => 36867

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifDTDigitized => 36868

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifCompConfig => 37121

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifCompBPP => 37122

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifShutterSpeed => 37377

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifAperture => 37378

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifBrightness => 37379

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifExposureBias => 37380

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifMaxAperture => 37381

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifSubjectDist => 37382

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifMeteringMode => 37383

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifLightSource => 37384

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifFlash => 37385

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifFocalLength => 37386

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifSubjectArea => 37396

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifMakerNote => 37500

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifUserComment => 37510

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifDTSubsec => 37520

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifDTOrigSS => 37521

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifDTDigSS => 37522

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifFPXVer => 40960

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifColorSpace => 40961

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifPixXDim => 40962

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifPixYDim => 40963

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifRelatedWav => 40964

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifInterop => 40965

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifFlashEnergy => 41483

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifSpatialFR => 41484

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifFocalXRes => 41486

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifFocalYRes => 41487

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifFocalResUnit => 41488

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifSubjectLoc => 41492

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifExposureIndex => 41493

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifSensingMethod => 41495

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifFileSource => 41728

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifSceneType => 41729

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifCfaPattern => 41730

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifCustomRendered => 41985

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifExposureMode => 41986

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifWhiteBalance => 41987

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifDigitalZoomRatio => 41988

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifFocalLengthIn35mmFilm => 41989

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifSceneCaptureType => 41990

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifGainControl => 41991

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifContrast => 41992

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifSaturation => 41993

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifSharpness => 41994

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifDeviceSettingDesc => 41995

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifSubjectDistanceRange => 41996

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagExifUniqueImageID => 42016

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsVer => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsLatitudeRef => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsLatitude => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsLongitudeRef => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsLongitude => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsAltitudeRef => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsAltitude => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsGpsTime => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsGpsSatellites => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsGpsStatus => 9

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsGpsMeasureMode => 10

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsGpsDop => 11

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsSpeedRef => 12

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsSpeed => 13

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsTrackRef => 14

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsTrack => 15

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsImgDirRef => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsImgDir => 17

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsMapDatum => 18

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsDestLatRef => 19

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsDestLat => 20

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsDestLongRef => 21

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsDestLong => 22

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsDestBearRef => 23

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsDestBear => 24

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsDestDistRef => 25

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsDestDist => 26

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsProcessingMethod => 27

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsAreaInformation => 28

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsDate => 29

    /**
     * @type {Integer (UInt32)}
     */
    static PropertyTagGpsDifferential => 30

    /**
     * @type {Integer (UInt32)}
     */
    static GDIP_EMFPLUSFLAGS_DISPLAY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ALPHA_SHIFT => 24

    /**
     * @type {Integer (UInt32)}
     */
    static RED_SHIFT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static GREEN_SHIFT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BLUE_SHIFT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PixelFormatIndexed => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PixelFormatGDI => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PixelFormatAlpha => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PixelFormatPAlpha => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static PixelFormatExtended => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static PixelFormatCanonical => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static PixelFormatUndefined => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PixelFormatDontCare => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PixelFormatMax => 16

    /**
     * @type {Integer (Single)}
     */
    static FlatnessDefault => 0.25

    /**
     * @type {String}
     */
    static BlurEffectGuid => "{633c80a4-1843-482b-9ef2-be2834c5fdd4}"

    /**
     * @type {String}
     */
    static SharpenEffectGuid => "{63cbf3ee-c526-402c-8f71-62c540bf5142}"

    /**
     * @type {String}
     */
    static ColorMatrixEffectGuid => "{718f2615-7933-40e3-a511-5f68fe14dd74}"

    /**
     * @type {String}
     */
    static ColorLUTEffectGuid => "{a7ce72a9-0f7f-40d7-b3cc-d0c02d5c3212}"

    /**
     * @type {String}
     */
    static BrightnessContrastEffectGuid => "{d3a1dbe1-8ec4-4c17-9f4c-ea97ad1c343d}"

    /**
     * @type {String}
     */
    static HueSaturationLightnessEffectGuid => "{8b2dd6c3-eb07-4d87-a5f0-7108e26a9c5f}"

    /**
     * @type {String}
     */
    static LevelsEffectGuid => "{99c354ec-2a31-4f3a-8c34-17a803b33a25}"

    /**
     * @type {String}
     */
    static TintEffectGuid => "{1077af00-2848-4441-9489-44ad4c2d7a2c}"

    /**
     * @type {String}
     */
    static ColorBalanceEffectGuid => "{537e597d-251e-48da-9664-29ca496b70f8}"

    /**
     * @type {String}
     */
    static RedEyeCorrectionEffectGuid => "{74d29d05-69a4-4266-9549-3cc52836b632}"

    /**
     * @type {String}
     */
    static ColorCurveEffectGuid => "{dd6a0022-58e4-4a67-9d9b-d48eb881a53d}"
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer} size 
     * @returns {Pointer<Void>} 
     */
    static GdipAlloc(size) {
        result := DllCall("gdiplus.dll\GdipAlloc", "ptr", size, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ptr 
     * @returns {String} Nothing - always returns an empty string
     */
    static GdipFree(ptr) {
        DllCall("gdiplus.dll\GdipFree", "ptr", ptr)
    }

    /**
     * The GdiplusStartup function initializes Windows GDI+. Call GdiplusStartup before making any other GDI+ calls, and call GdiplusShutdown when you have finished using GDI+.
     * @param {Pointer<UIntPtr>} token Type: [out] <b>ULONG_PTR token*</b>
     * 
     * Pointer to a <b>ULONG_PTR</b> that receives a token. Pass the token to <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusinit/nf-gdiplusinit-gdiplusshutdown">GdiplusShutdown</a> when you have finished using GDI+.
     * @param {Pointer<GdiplusStartupInput>} input Type: [in] <b>const <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusinit/ns-gdiplusinit-gdiplusstartupinput">GdiplusStartupInput</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusinit/ns-gdiplusinit-gdiplusstartupinput">GdiplusStartupInput</a> structure that contains the GDI+ version, a pointer to a debug callback function, a Boolean value that specifies whether to suppress the background thread, and a Boolean value that specifies whether to suppress external image codecs.
     * @param {Pointer<GdiplusStartupOutput>} output Type: [out] <b><a href="https://docs.microsoft.com/windows/desktop/api/gdiplusinit/ns-gdiplusinit-gdiplusstartupoutput">GdiplusStartupOutput</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusinit/ns-gdiplusinit-gdiplusstartupoutput">GdiplusStartupOutput</a> structure that receives a pointer to a notification hook function and a pointer to a notification unhook function. If the <b>SuppressBackgroundThread</b> data member of the <i>input</i> parameter is <b>FALSE</b>, then this parameter can be <b>NULL</b>.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/gdiplustypes/ne-gdiplustypes-status">Status</a></b>
     * 
     * If the function succeeds, it returns <b>Ok</b>, which is an element of the <a href="/windows/desktop/api/gdiplustypes/ne-gdiplustypes-status">Status</a> enumeration.
     * 
     * If the function fails, it returns one of the other elements of the <a href="/windows/desktop/api/gdiplustypes/ne-gdiplustypes-status">Status</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//gdiplusinit/nf-gdiplusinit-gdiplusstartup
     * @since windows5.1.2600
     */
    static GdiplusStartup(token, input, output) {
        result := DllCall("gdiplus.dll\GdiplusStartup", "ptr*", token, "ptr", input, "ptr", output, "int")
        return result
    }

    /**
     * The GdiplusShutdown function cleans up resources used by Windows GDI+. Each call to GdiplusStartup should be paired with a call to GdiplusShutdown.
     * @remarks
     * 
     * You must call <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusinit/nf-gdiplusinit-gdiplusstartup">GdiplusStartup</a> before you create any GDI+ objects, and you must delete all of your GDI+ objects (or have them go out of scope) before you call <b>GdiplusShutdown</b>.
     * 
     * <div class="alert"><b>Note</b>  For Windows 7 and earlier, if GDI+ can't create a font family, it substitutes the generic Sans Serif family and client-side caches the pointer for the generic family. Because calls to <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusinit/nf-gdiplusinit-gdiplusstartup">GdiplusStartup</a> and <b>GdiplusShutdown</b> are not aware of this caching, the operating system retains the pointer for the generic family object past the object's lifetime, which causes the operating system to crash. For Windows 8 and later, GDI+ returns a sentinel value for the generic family object that remains constant across calls to <b>GdiplusStartup</b> and <b>GdiplusShutdown</b> so the operating system doesn't retain the pointer for the generic family object past the object's lifetime.</div>
     * <div> </div>
     * 
     * 
     * @param {Pointer} token Type: [in] <b>ULONG_PTR</b>
     * 
     * Token returned by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusinit/nf-gdiplusinit-gdiplusstartup">GdiplusStartup</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//gdiplusinit/nf-gdiplusinit-gdiplusshutdown
     * @since windows5.1.2600
     */
    static GdiplusShutdown(token) {
        DllCall("gdiplus.dll\GdiplusShutdown", "ptr", token)
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<CGpEffect>} effect 
     * @returns {Integer} 
     */
    static GdipCreateEffect(guid, effect) {
        result := DllCall("gdiplus.dll\GdipCreateEffect", "ptr", guid, "ptr", effect, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<CGpEffect>} effect 
     * @returns {Integer} 
     */
    static GdipDeleteEffect(effect) {
        result := DllCall("gdiplus.dll\GdipDeleteEffect", "ptr", effect, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<CGpEffect>} effect 
     * @param {Pointer<UInt32>} size 
     * @returns {Integer} 
     */
    static GdipGetEffectParameterSize(effect, size) {
        result := DllCall("gdiplus.dll\GdipGetEffectParameterSize", "ptr", effect, "uint*", size, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<CGpEffect>} effect 
     * @param {Pointer<Void>} params 
     * @param {Integer} size 
     * @returns {Integer} 
     */
    static GdipSetEffectParameters(effect, params, size) {
        result := DllCall("gdiplus.dll\GdipSetEffectParameters", "ptr", effect, "ptr", params, "uint", size, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<CGpEffect>} effect 
     * @param {Pointer<UInt32>} size 
     * @param {Pointer<Void>} params 
     * @returns {Integer} 
     */
    static GdipGetEffectParameters(effect, size, params) {
        result := DllCall("gdiplus.dll\GdipGetEffectParameters", "ptr", effect, "uint*", size, "ptr", params, "int")
        return result
    }

    /**
     * 
     * @param {Integer} brushMode 
     * @param {Pointer<GpPath>} path 
     * @returns {Integer} 
     */
    static GdipCreatePath(brushMode, path) {
        result := DllCall("gdiplus.dll\GdipCreatePath", "int", brushMode, "ptr", path, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PointF>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Pointer<GpPath>} path 
     * @returns {Integer} 
     */
    static GdipCreatePath2(param0, param1, param2, param3, path) {
        result := DllCall("gdiplus.dll\GdipCreatePath2", "ptr", param0, "char*", param1, "int", param2, "int", param3, "ptr", path, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Point>} param0 
     * @param {Pointer<Byte>} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Pointer<GpPath>} path 
     * @returns {Integer} 
     */
    static GdipCreatePath2I(param0, param1, param2, param3, path) {
        result := DllCall("gdiplus.dll\GdipCreatePath2I", "ptr", param0, "char*", param1, "int", param2, "int", param3, "ptr", path, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<GpPath>} clonePath 
     * @returns {Integer} 
     */
    static GdipClonePath(path, clonePath) {
        result := DllCall("gdiplus.dll\GdipClonePath", "ptr", path, "ptr", clonePath, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @returns {Integer} 
     */
    static GdipDeletePath(path) {
        result := DllCall("gdiplus.dll\GdipDeletePath", "ptr", path, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @returns {Integer} 
     */
    static GdipResetPath(path) {
        result := DllCall("gdiplus.dll\GdipResetPath", "ptr", path, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<Int32>} count 
     * @returns {Integer} 
     */
    static GdipGetPointCount(path, count) {
        result := DllCall("gdiplus.dll\GdipGetPointCount", "ptr", path, "int*", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer} types 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipGetPathTypes(path, types, count) {
        result := DllCall("gdiplus.dll\GdipGetPathTypes", "ptr", path, "ptr", types, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} param0 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipGetPathPoints(param0, points, count) {
        result := DllCall("gdiplus.dll\GdipGetPathPoints", "ptr", param0, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} param0 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipGetPathPointsI(param0, points, count) {
        result := DllCall("gdiplus.dll\GdipGetPathPointsI", "ptr", param0, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<Int32>} fillmode 
     * @returns {Integer} 
     */
    static GdipGetPathFillMode(path, fillmode) {
        result := DllCall("gdiplus.dll\GdipGetPathFillMode", "ptr", path, "int*", fillmode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Integer} fillmode 
     * @returns {Integer} 
     */
    static GdipSetPathFillMode(path, fillmode) {
        result := DllCall("gdiplus.dll\GdipSetPathFillMode", "ptr", path, "int", fillmode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<PathData>} pathData 
     * @returns {Integer} 
     */
    static GdipGetPathData(path, pathData) {
        result := DllCall("gdiplus.dll\GdipGetPathData", "ptr", path, "ptr", pathData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @returns {Integer} 
     */
    static GdipStartPathFigure(path) {
        result := DllCall("gdiplus.dll\GdipStartPathFigure", "ptr", path, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @returns {Integer} 
     */
    static GdipClosePathFigure(path) {
        result := DllCall("gdiplus.dll\GdipClosePathFigure", "ptr", path, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @returns {Integer} 
     */
    static GdipClosePathFigures(path) {
        result := DllCall("gdiplus.dll\GdipClosePathFigures", "ptr", path, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @returns {Integer} 
     */
    static GdipSetPathMarker(path) {
        result := DllCall("gdiplus.dll\GdipSetPathMarker", "ptr", path, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @returns {Integer} 
     */
    static GdipClearPathMarkers(path) {
        result := DllCall("gdiplus.dll\GdipClearPathMarkers", "ptr", path, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @returns {Integer} 
     */
    static GdipReversePath(path) {
        result := DllCall("gdiplus.dll\GdipReversePath", "ptr", path, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<PointF>} lastPoint 
     * @returns {Integer} 
     */
    static GdipGetPathLastPoint(path, lastPoint) {
        result := DllCall("gdiplus.dll\GdipGetPathLastPoint", "ptr", path, "ptr", lastPoint, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Float} x1 
     * @param {Float} y1 
     * @param {Float} x2 
     * @param {Float} y2 
     * @returns {Integer} 
     */
    static GdipAddPathLine(path, x1, y1, x2, y2) {
        result := DllCall("gdiplus.dll\GdipAddPathLine", "ptr", path, "float", x1, "float", y1, "float", x2, "float", y2, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathLine2(path, points, count) {
        result := DllCall("gdiplus.dll\GdipAddPathLine2", "ptr", path, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @param {Float} startAngle 
     * @param {Float} sweepAngle 
     * @returns {Integer} 
     */
    static GdipAddPathArc(path, x, y, width, height, startAngle, sweepAngle) {
        result := DllCall("gdiplus.dll\GdipAddPathArc", "ptr", path, "float", x, "float", y, "float", width, "float", height, "float", startAngle, "float", sweepAngle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Float} x1 
     * @param {Float} y1 
     * @param {Float} x2 
     * @param {Float} y2 
     * @param {Float} x3 
     * @param {Float} y3 
     * @param {Float} x4 
     * @param {Float} y4 
     * @returns {Integer} 
     */
    static GdipAddPathBezier(path, x1, y1, x2, y2, x3, y3, x4, y4) {
        result := DllCall("gdiplus.dll\GdipAddPathBezier", "ptr", path, "float", x1, "float", y1, "float", x2, "float", y2, "float", x3, "float", y3, "float", x4, "float", y4, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathBeziers(path, points, count) {
        result := DllCall("gdiplus.dll\GdipAddPathBeziers", "ptr", path, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathCurve(path, points, count) {
        result := DllCall("gdiplus.dll\GdipAddPathCurve", "ptr", path, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipAddPathCurve2(path, points, count, tension) {
        result := DllCall("gdiplus.dll\GdipAddPathCurve2", "ptr", path, "ptr", points, "int", count, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @param {Integer} offset 
     * @param {Integer} numberOfSegments 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipAddPathCurve3(path, points, count, offset, numberOfSegments, tension) {
        result := DllCall("gdiplus.dll\GdipAddPathCurve3", "ptr", path, "ptr", points, "int", count, "int", offset, "int", numberOfSegments, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathClosedCurve(path, points, count) {
        result := DllCall("gdiplus.dll\GdipAddPathClosedCurve", "ptr", path, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipAddPathClosedCurve2(path, points, count, tension) {
        result := DllCall("gdiplus.dll\GdipAddPathClosedCurve2", "ptr", path, "ptr", points, "int", count, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @returns {Integer} 
     */
    static GdipAddPathRectangle(path, x, y, width, height) {
        result := DllCall("gdiplus.dll\GdipAddPathRectangle", "ptr", path, "float", x, "float", y, "float", width, "float", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<RectF>} rects 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathRectangles(path, rects, count) {
        result := DllCall("gdiplus.dll\GdipAddPathRectangles", "ptr", path, "ptr", rects, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @returns {Integer} 
     */
    static GdipAddPathEllipse(path, x, y, width, height) {
        result := DllCall("gdiplus.dll\GdipAddPathEllipse", "ptr", path, "float", x, "float", y, "float", width, "float", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @param {Float} startAngle 
     * @param {Float} sweepAngle 
     * @returns {Integer} 
     */
    static GdipAddPathPie(path, x, y, width, height, startAngle, sweepAngle) {
        result := DllCall("gdiplus.dll\GdipAddPathPie", "ptr", path, "float", x, "float", y, "float", width, "float", height, "float", startAngle, "float", sweepAngle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathPolygon(path, points, count) {
        result := DllCall("gdiplus.dll\GdipAddPathPolygon", "ptr", path, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<GpPath>} addingPath 
     * @param {BOOL} connect 
     * @returns {Integer} 
     */
    static GdipAddPathPath(path, addingPath, connect) {
        result := DllCall("gdiplus.dll\GdipAddPathPath", "ptr", path, "ptr", addingPath, "int", connect, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {PWSTR} string 
     * @param {Integer} length 
     * @param {Pointer<GpFontFamily>} family 
     * @param {Integer} style 
     * @param {Float} emSize 
     * @param {Pointer<RectF>} layoutRect 
     * @param {Pointer<GpStringFormat>} format 
     * @returns {Integer} 
     */
    static GdipAddPathString(path, string, length, family, style, emSize, layoutRect, format) {
        string := string is String ? StrPtr(string) : string

        result := DllCall("gdiplus.dll\GdipAddPathString", "ptr", path, "ptr", string, "int", length, "ptr", family, "int", style, "float", emSize, "ptr", layoutRect, "ptr", format, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {PWSTR} string 
     * @param {Integer} length 
     * @param {Pointer<GpFontFamily>} family 
     * @param {Integer} style 
     * @param {Float} emSize 
     * @param {Pointer<Rect>} layoutRect 
     * @param {Pointer<GpStringFormat>} format 
     * @returns {Integer} 
     */
    static GdipAddPathStringI(path, string, length, family, style, emSize, layoutRect, format) {
        string := string is String ? StrPtr(string) : string

        result := DllCall("gdiplus.dll\GdipAddPathStringI", "ptr", path, "ptr", string, "int", length, "ptr", family, "int", style, "float", emSize, "ptr", layoutRect, "ptr", format, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Integer} x1 
     * @param {Integer} y1 
     * @param {Integer} x2 
     * @param {Integer} y2 
     * @returns {Integer} 
     */
    static GdipAddPathLineI(path, x1, y1, x2, y2) {
        result := DllCall("gdiplus.dll\GdipAddPathLineI", "ptr", path, "int", x1, "int", y1, "int", x2, "int", y2, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathLine2I(path, points, count) {
        result := DllCall("gdiplus.dll\GdipAddPathLine2I", "ptr", path, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Float} startAngle 
     * @param {Float} sweepAngle 
     * @returns {Integer} 
     */
    static GdipAddPathArcI(path, x, y, width, height, startAngle, sweepAngle) {
        result := DllCall("gdiplus.dll\GdipAddPathArcI", "ptr", path, "int", x, "int", y, "int", width, "int", height, "float", startAngle, "float", sweepAngle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Integer} x1 
     * @param {Integer} y1 
     * @param {Integer} x2 
     * @param {Integer} y2 
     * @param {Integer} x3 
     * @param {Integer} y3 
     * @param {Integer} x4 
     * @param {Integer} y4 
     * @returns {Integer} 
     */
    static GdipAddPathBezierI(path, x1, y1, x2, y2, x3, y3, x4, y4) {
        result := DllCall("gdiplus.dll\GdipAddPathBezierI", "ptr", path, "int", x1, "int", y1, "int", x2, "int", y2, "int", x3, "int", y3, "int", x4, "int", y4, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathBeziersI(path, points, count) {
        result := DllCall("gdiplus.dll\GdipAddPathBeziersI", "ptr", path, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathCurveI(path, points, count) {
        result := DllCall("gdiplus.dll\GdipAddPathCurveI", "ptr", path, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipAddPathCurve2I(path, points, count, tension) {
        result := DllCall("gdiplus.dll\GdipAddPathCurve2I", "ptr", path, "ptr", points, "int", count, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @param {Integer} offset 
     * @param {Integer} numberOfSegments 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipAddPathCurve3I(path, points, count, offset, numberOfSegments, tension) {
        result := DllCall("gdiplus.dll\GdipAddPathCurve3I", "ptr", path, "ptr", points, "int", count, "int", offset, "int", numberOfSegments, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathClosedCurveI(path, points, count) {
        result := DllCall("gdiplus.dll\GdipAddPathClosedCurveI", "ptr", path, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipAddPathClosedCurve2I(path, points, count, tension) {
        result := DllCall("gdiplus.dll\GdipAddPathClosedCurve2I", "ptr", path, "ptr", points, "int", count, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {Integer} 
     */
    static GdipAddPathRectangleI(path, x, y, width, height) {
        result := DllCall("gdiplus.dll\GdipAddPathRectangleI", "ptr", path, "int", x, "int", y, "int", width, "int", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<Rect>} rects 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathRectanglesI(path, rects, count) {
        result := DllCall("gdiplus.dll\GdipAddPathRectanglesI", "ptr", path, "ptr", rects, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {Integer} 
     */
    static GdipAddPathEllipseI(path, x, y, width, height) {
        result := DllCall("gdiplus.dll\GdipAddPathEllipseI", "ptr", path, "int", x, "int", y, "int", width, "int", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Float} startAngle 
     * @param {Float} sweepAngle 
     * @returns {Integer} 
     */
    static GdipAddPathPieI(path, x, y, width, height, startAngle, sweepAngle) {
        result := DllCall("gdiplus.dll\GdipAddPathPieI", "ptr", path, "int", x, "int", y, "int", width, "int", height, "float", startAngle, "float", sweepAngle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathPolygonI(path, points, count) {
        result := DllCall("gdiplus.dll\GdipAddPathPolygonI", "ptr", path, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<Matrix>} matrix 
     * @param {Float} flatness 
     * @returns {Integer} 
     */
    static GdipFlattenPath(path, matrix, flatness) {
        result := DllCall("gdiplus.dll\GdipFlattenPath", "ptr", path, "ptr", matrix, "float", flatness, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<Matrix>} matrix 
     * @param {Float} flatness 
     * @returns {Integer} 
     */
    static GdipWindingModeOutline(path, matrix, flatness) {
        result := DllCall("gdiplus.dll\GdipWindingModeOutline", "ptr", path, "ptr", matrix, "float", flatness, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} nativePath 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Matrix>} matrix 
     * @param {Float} flatness 
     * @returns {Integer} 
     */
    static GdipWidenPath(nativePath, pen, matrix, flatness) {
        result := DllCall("gdiplus.dll\GdipWidenPath", "ptr", nativePath, "ptr", pen, "ptr", matrix, "float", flatness, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<Matrix>} matrix 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @param {Float} srcx 
     * @param {Float} srcy 
     * @param {Float} srcwidth 
     * @param {Float} srcheight 
     * @param {Integer} warpMode 
     * @param {Float} flatness 
     * @returns {Integer} 
     */
    static GdipWarpPath(path, matrix, points, count, srcx, srcy, srcwidth, srcheight, warpMode, flatness) {
        result := DllCall("gdiplus.dll\GdipWarpPath", "ptr", path, "ptr", matrix, "ptr", points, "int", count, "float", srcx, "float", srcy, "float", srcwidth, "float", srcheight, "int", warpMode, "float", flatness, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<Matrix>} matrix 
     * @returns {Integer} 
     */
    static GdipTransformPath(path, matrix) {
        result := DllCall("gdiplus.dll\GdipTransformPath", "ptr", path, "ptr", matrix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<RectF>} bounds 
     * @param {Pointer<Matrix>} matrix 
     * @param {Pointer<GpPen>} pen 
     * @returns {Integer} 
     */
    static GdipGetPathWorldBounds(path, bounds, matrix, pen) {
        result := DllCall("gdiplus.dll\GdipGetPathWorldBounds", "ptr", path, "ptr", bounds, "ptr", matrix, "ptr", pen, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<Rect>} bounds 
     * @param {Pointer<Matrix>} matrix 
     * @param {Pointer<GpPen>} pen 
     * @returns {Integer} 
     */
    static GdipGetPathWorldBoundsI(path, bounds, matrix, pen) {
        result := DllCall("gdiplus.dll\GdipGetPathWorldBoundsI", "ptr", path, "ptr", bounds, "ptr", matrix, "ptr", pen, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result 
     * @returns {Integer} 
     */
    static GdipIsVisiblePathPoint(path, x, y, graphics, result) {
        result := DllCall("gdiplus.dll\GdipIsVisiblePathPoint", "ptr", path, "float", x, "float", y, "ptr", graphics, "ptr", result, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result 
     * @returns {Integer} 
     */
    static GdipIsVisiblePathPointI(path, x, y, graphics, result) {
        result := DllCall("gdiplus.dll\GdipIsVisiblePathPointI", "ptr", path, "int", x, "int", y, "ptr", graphics, "ptr", result, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result 
     * @returns {Integer} 
     */
    static GdipIsOutlineVisiblePathPoint(path, x, y, pen, graphics, result) {
        result := DllCall("gdiplus.dll\GdipIsOutlineVisiblePathPoint", "ptr", path, "float", x, "float", y, "ptr", pen, "ptr", graphics, "ptr", result, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result 
     * @returns {Integer} 
     */
    static GdipIsOutlineVisiblePathPointI(path, x, y, pen, graphics, result) {
        result := DllCall("gdiplus.dll\GdipIsOutlineVisiblePathPointI", "ptr", path, "int", x, "int", y, "ptr", pen, "ptr", graphics, "ptr", result, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathIterator>} iterator 
     * @param {Pointer<GpPath>} path 
     * @returns {Integer} 
     */
    static GdipCreatePathIter(iterator, path) {
        result := DllCall("gdiplus.dll\GdipCreatePathIter", "ptr", iterator, "ptr", path, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathIterator>} iterator 
     * @returns {Integer} 
     */
    static GdipDeletePathIter(iterator) {
        result := DllCall("gdiplus.dll\GdipDeletePathIter", "ptr", iterator, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathIterator>} iterator 
     * @param {Pointer<Int32>} resultCount 
     * @param {Pointer<Int32>} startIndex 
     * @param {Pointer<Int32>} endIndex 
     * @param {Pointer<BOOL>} isClosed 
     * @returns {Integer} 
     */
    static GdipPathIterNextSubpath(iterator, resultCount, startIndex, endIndex, isClosed) {
        result := DllCall("gdiplus.dll\GdipPathIterNextSubpath", "ptr", iterator, "int*", resultCount, "int*", startIndex, "int*", endIndex, "ptr", isClosed, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathIterator>} iterator 
     * @param {Pointer<Int32>} resultCount 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<BOOL>} isClosed 
     * @returns {Integer} 
     */
    static GdipPathIterNextSubpathPath(iterator, resultCount, path, isClosed) {
        result := DllCall("gdiplus.dll\GdipPathIterNextSubpathPath", "ptr", iterator, "int*", resultCount, "ptr", path, "ptr", isClosed, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathIterator>} iterator 
     * @param {Pointer<Int32>} resultCount 
     * @param {Pointer<Byte>} pathType 
     * @param {Pointer<Int32>} startIndex 
     * @param {Pointer<Int32>} endIndex 
     * @returns {Integer} 
     */
    static GdipPathIterNextPathType(iterator, resultCount, pathType, startIndex, endIndex) {
        result := DllCall("gdiplus.dll\GdipPathIterNextPathType", "ptr", iterator, "int*", resultCount, "char*", pathType, "int*", startIndex, "int*", endIndex, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathIterator>} iterator 
     * @param {Pointer<Int32>} resultCount 
     * @param {Pointer<Int32>} startIndex 
     * @param {Pointer<Int32>} endIndex 
     * @returns {Integer} 
     */
    static GdipPathIterNextMarker(iterator, resultCount, startIndex, endIndex) {
        result := DllCall("gdiplus.dll\GdipPathIterNextMarker", "ptr", iterator, "int*", resultCount, "int*", startIndex, "int*", endIndex, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathIterator>} iterator 
     * @param {Pointer<Int32>} resultCount 
     * @param {Pointer<GpPath>} path 
     * @returns {Integer} 
     */
    static GdipPathIterNextMarkerPath(iterator, resultCount, path) {
        result := DllCall("gdiplus.dll\GdipPathIterNextMarkerPath", "ptr", iterator, "int*", resultCount, "ptr", path, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathIterator>} iterator 
     * @param {Pointer<Int32>} count 
     * @returns {Integer} 
     */
    static GdipPathIterGetCount(iterator, count) {
        result := DllCall("gdiplus.dll\GdipPathIterGetCount", "ptr", iterator, "int*", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathIterator>} iterator 
     * @param {Pointer<Int32>} count 
     * @returns {Integer} 
     */
    static GdipPathIterGetSubpathCount(iterator, count) {
        result := DllCall("gdiplus.dll\GdipPathIterGetSubpathCount", "ptr", iterator, "int*", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathIterator>} iterator 
     * @param {Pointer<BOOL>} valid 
     * @returns {Integer} 
     */
    static GdipPathIterIsValid(iterator, valid) {
        result := DllCall("gdiplus.dll\GdipPathIterIsValid", "ptr", iterator, "ptr", valid, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathIterator>} iterator 
     * @param {Pointer<BOOL>} hasCurve 
     * @returns {Integer} 
     */
    static GdipPathIterHasCurve(iterator, hasCurve) {
        result := DllCall("gdiplus.dll\GdipPathIterHasCurve", "ptr", iterator, "ptr", hasCurve, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathIterator>} iterator 
     * @returns {Integer} 
     */
    static GdipPathIterRewind(iterator) {
        result := DllCall("gdiplus.dll\GdipPathIterRewind", "ptr", iterator, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathIterator>} iterator 
     * @param {Pointer<Int32>} resultCount 
     * @param {Pointer<PointF>} points 
     * @param {Pointer<Byte>} types 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipPathIterEnumerate(iterator, resultCount, points, types, count) {
        result := DllCall("gdiplus.dll\GdipPathIterEnumerate", "ptr", iterator, "int*", resultCount, "ptr", points, "char*", types, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathIterator>} iterator 
     * @param {Pointer<Int32>} resultCount 
     * @param {Pointer<PointF>} points 
     * @param {Pointer<Byte>} types 
     * @param {Integer} startIndex 
     * @param {Integer} endIndex 
     * @returns {Integer} 
     */
    static GdipPathIterCopyData(iterator, resultCount, points, types, startIndex, endIndex) {
        result := DllCall("gdiplus.dll\GdipPathIterCopyData", "ptr", iterator, "int*", resultCount, "ptr", points, "char*", types, "int", startIndex, "int", endIndex, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix 
     * @returns {Integer} 
     */
    static GdipCreateMatrix(matrix) {
        result := DllCall("gdiplus.dll\GdipCreateMatrix", "ptr", matrix, "int")
        return result
    }

    /**
     * 
     * @param {Float} m11 
     * @param {Float} m12 
     * @param {Float} m21 
     * @param {Float} m22 
     * @param {Float} dx 
     * @param {Float} dy 
     * @param {Pointer<Matrix>} matrix 
     * @returns {Integer} 
     */
    static GdipCreateMatrix2(m11, m12, m21, m22, dx, dy, matrix) {
        result := DllCall("gdiplus.dll\GdipCreateMatrix2", "float", m11, "float", m12, "float", m21, "float", m22, "float", dx, "float", dy, "ptr", matrix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RectF>} rect 
     * @param {Pointer<PointF>} dstplg 
     * @param {Pointer<Matrix>} matrix 
     * @returns {Integer} 
     */
    static GdipCreateMatrix3(rect, dstplg, matrix) {
        result := DllCall("gdiplus.dll\GdipCreateMatrix3", "ptr", rect, "ptr", dstplg, "ptr", matrix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Rect>} rect 
     * @param {Pointer<Point>} dstplg 
     * @param {Pointer<Matrix>} matrix 
     * @returns {Integer} 
     */
    static GdipCreateMatrix3I(rect, dstplg, matrix) {
        result := DllCall("gdiplus.dll\GdipCreateMatrix3I", "ptr", rect, "ptr", dstplg, "ptr", matrix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix 
     * @param {Pointer<Matrix>} cloneMatrix 
     * @returns {Integer} 
     */
    static GdipCloneMatrix(matrix, cloneMatrix) {
        result := DllCall("gdiplus.dll\GdipCloneMatrix", "ptr", matrix, "ptr", cloneMatrix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix 
     * @returns {Integer} 
     */
    static GdipDeleteMatrix(matrix) {
        result := DllCall("gdiplus.dll\GdipDeleteMatrix", "ptr", matrix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix 
     * @param {Float} m11 
     * @param {Float} m12 
     * @param {Float} m21 
     * @param {Float} m22 
     * @param {Float} dx 
     * @param {Float} dy 
     * @returns {Integer} 
     */
    static GdipSetMatrixElements(matrix, m11, m12, m21, m22, dx, dy) {
        result := DllCall("gdiplus.dll\GdipSetMatrixElements", "ptr", matrix, "float", m11, "float", m12, "float", m21, "float", m22, "float", dx, "float", dy, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix 
     * @param {Pointer<Matrix>} matrix2 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipMultiplyMatrix(matrix, matrix2, order) {
        result := DllCall("gdiplus.dll\GdipMultiplyMatrix", "ptr", matrix, "ptr", matrix2, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix 
     * @param {Float} offsetX 
     * @param {Float} offsetY 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipTranslateMatrix(matrix, offsetX, offsetY, order) {
        result := DllCall("gdiplus.dll\GdipTranslateMatrix", "ptr", matrix, "float", offsetX, "float", offsetY, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix 
     * @param {Float} scaleX 
     * @param {Float} scaleY 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipScaleMatrix(matrix, scaleX, scaleY, order) {
        result := DllCall("gdiplus.dll\GdipScaleMatrix", "ptr", matrix, "float", scaleX, "float", scaleY, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix 
     * @param {Float} angle 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipRotateMatrix(matrix, angle, order) {
        result := DllCall("gdiplus.dll\GdipRotateMatrix", "ptr", matrix, "float", angle, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix 
     * @param {Float} shearX 
     * @param {Float} shearY 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipShearMatrix(matrix, shearX, shearY, order) {
        result := DllCall("gdiplus.dll\GdipShearMatrix", "ptr", matrix, "float", shearX, "float", shearY, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix 
     * @returns {Integer} 
     */
    static GdipInvertMatrix(matrix) {
        result := DllCall("gdiplus.dll\GdipInvertMatrix", "ptr", matrix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix 
     * @param {Pointer<PointF>} pts 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipTransformMatrixPoints(matrix, pts, count) {
        result := DllCall("gdiplus.dll\GdipTransformMatrixPoints", "ptr", matrix, "ptr", pts, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix 
     * @param {Pointer<Point>} pts 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipTransformMatrixPointsI(matrix, pts, count) {
        result := DllCall("gdiplus.dll\GdipTransformMatrixPointsI", "ptr", matrix, "ptr", pts, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix 
     * @param {Pointer<PointF>} pts 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipVectorTransformMatrixPoints(matrix, pts, count) {
        result := DllCall("gdiplus.dll\GdipVectorTransformMatrixPoints", "ptr", matrix, "ptr", pts, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix 
     * @param {Pointer<Point>} pts 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipVectorTransformMatrixPointsI(matrix, pts, count) {
        result := DllCall("gdiplus.dll\GdipVectorTransformMatrixPointsI", "ptr", matrix, "ptr", pts, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix 
     * @param {Pointer<Single>} matrixOut 
     * @returns {Integer} 
     */
    static GdipGetMatrixElements(matrix, matrixOut) {
        result := DllCall("gdiplus.dll\GdipGetMatrixElements", "ptr", matrix, "float*", matrixOut, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix 
     * @param {Pointer<BOOL>} result 
     * @returns {Integer} 
     */
    static GdipIsMatrixInvertible(matrix, result) {
        result := DllCall("gdiplus.dll\GdipIsMatrixInvertible", "ptr", matrix, "ptr", result, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix 
     * @param {Pointer<BOOL>} result 
     * @returns {Integer} 
     */
    static GdipIsMatrixIdentity(matrix, result) {
        result := DllCall("gdiplus.dll\GdipIsMatrixIdentity", "ptr", matrix, "ptr", result, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix 
     * @param {Pointer<Matrix>} matrix2 
     * @param {Pointer<BOOL>} result 
     * @returns {Integer} 
     */
    static GdipIsMatrixEqual(matrix, matrix2, result) {
        result := DllCall("gdiplus.dll\GdipIsMatrixEqual", "ptr", matrix, "ptr", matrix2, "ptr", result, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @returns {Integer} 
     */
    static GdipCreateRegion(region) {
        result := DllCall("gdiplus.dll\GdipCreateRegion", "ptr", region, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RectF>} rect 
     * @param {Pointer<GpRegion>} region 
     * @returns {Integer} 
     */
    static GdipCreateRegionRect(rect, region) {
        result := DllCall("gdiplus.dll\GdipCreateRegionRect", "ptr", rect, "ptr", region, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Rect>} rect 
     * @param {Pointer<GpRegion>} region 
     * @returns {Integer} 
     */
    static GdipCreateRegionRectI(rect, region) {
        result := DllCall("gdiplus.dll\GdipCreateRegionRectI", "ptr", rect, "ptr", region, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<GpRegion>} region 
     * @returns {Integer} 
     */
    static GdipCreateRegionPath(path, region) {
        result := DllCall("gdiplus.dll\GdipCreateRegionPath", "ptr", path, "ptr", region, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} regionData 
     * @param {Integer} size 
     * @param {Pointer<GpRegion>} region 
     * @returns {Integer} 
     */
    static GdipCreateRegionRgnData(regionData, size, region) {
        result := DllCall("gdiplus.dll\GdipCreateRegionRgnData", "char*", regionData, "int", size, "ptr", region, "int")
        return result
    }

    /**
     * 
     * @param {HRGN} hRgn 
     * @param {Pointer<GpRegion>} region 
     * @returns {Integer} 
     */
    static GdipCreateRegionHrgn(hRgn, region) {
        hRgn := hRgn is Win32Handle ? NumGet(hRgn, "ptr") : hRgn

        result := DllCall("gdiplus.dll\GdipCreateRegionHrgn", "ptr", hRgn, "ptr", region, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @param {Pointer<GpRegion>} cloneRegion 
     * @returns {Integer} 
     */
    static GdipCloneRegion(region, cloneRegion) {
        result := DllCall("gdiplus.dll\GdipCloneRegion", "ptr", region, "ptr", cloneRegion, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @returns {Integer} 
     */
    static GdipDeleteRegion(region) {
        result := DllCall("gdiplus.dll\GdipDeleteRegion", "ptr", region, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @returns {Integer} 
     */
    static GdipSetInfinite(region) {
        result := DllCall("gdiplus.dll\GdipSetInfinite", "ptr", region, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @returns {Integer} 
     */
    static GdipSetEmpty(region) {
        result := DllCall("gdiplus.dll\GdipSetEmpty", "ptr", region, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @param {Pointer<RectF>} rect 
     * @param {Integer} combineMode 
     * @returns {Integer} 
     */
    static GdipCombineRegionRect(region, rect, combineMode) {
        result := DllCall("gdiplus.dll\GdipCombineRegionRect", "ptr", region, "ptr", rect, "int", combineMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @param {Pointer<Rect>} rect 
     * @param {Integer} combineMode 
     * @returns {Integer} 
     */
    static GdipCombineRegionRectI(region, rect, combineMode) {
        result := DllCall("gdiplus.dll\GdipCombineRegionRectI", "ptr", region, "ptr", rect, "int", combineMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @param {Pointer<GpPath>} path 
     * @param {Integer} combineMode 
     * @returns {Integer} 
     */
    static GdipCombineRegionPath(region, path, combineMode) {
        result := DllCall("gdiplus.dll\GdipCombineRegionPath", "ptr", region, "ptr", path, "int", combineMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @param {Pointer<GpRegion>} region2 
     * @param {Integer} combineMode 
     * @returns {Integer} 
     */
    static GdipCombineRegionRegion(region, region2, combineMode) {
        result := DllCall("gdiplus.dll\GdipCombineRegionRegion", "ptr", region, "ptr", region2, "int", combineMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @param {Float} dx 
     * @param {Float} dy 
     * @returns {Integer} 
     */
    static GdipTranslateRegion(region, dx, dy) {
        result := DllCall("gdiplus.dll\GdipTranslateRegion", "ptr", region, "float", dx, "float", dy, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @param {Integer} dx 
     * @param {Integer} dy 
     * @returns {Integer} 
     */
    static GdipTranslateRegionI(region, dx, dy) {
        result := DllCall("gdiplus.dll\GdipTranslateRegionI", "ptr", region, "int", dx, "int", dy, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @param {Pointer<Matrix>} matrix 
     * @returns {Integer} 
     */
    static GdipTransformRegion(region, matrix) {
        result := DllCall("gdiplus.dll\GdipTransformRegion", "ptr", region, "ptr", matrix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<RectF>} rect 
     * @returns {Integer} 
     */
    static GdipGetRegionBounds(region, graphics, rect) {
        result := DllCall("gdiplus.dll\GdipGetRegionBounds", "ptr", region, "ptr", graphics, "ptr", rect, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Rect>} rect 
     * @returns {Integer} 
     */
    static GdipGetRegionBoundsI(region, graphics, rect) {
        result := DllCall("gdiplus.dll\GdipGetRegionBoundsI", "ptr", region, "ptr", graphics, "ptr", rect, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<HRGN>} hRgn 
     * @returns {Integer} 
     */
    static GdipGetRegionHRgn(region, graphics, hRgn) {
        result := DllCall("gdiplus.dll\GdipGetRegionHRgn", "ptr", region, "ptr", graphics, "ptr", hRgn, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result 
     * @returns {Integer} 
     */
    static GdipIsEmptyRegion(region, graphics, result) {
        result := DllCall("gdiplus.dll\GdipIsEmptyRegion", "ptr", region, "ptr", graphics, "ptr", result, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result 
     * @returns {Integer} 
     */
    static GdipIsInfiniteRegion(region, graphics, result) {
        result := DllCall("gdiplus.dll\GdipIsInfiniteRegion", "ptr", region, "ptr", graphics, "ptr", result, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @param {Pointer<GpRegion>} region2 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result 
     * @returns {Integer} 
     */
    static GdipIsEqualRegion(region, region2, graphics, result) {
        result := DllCall("gdiplus.dll\GdipIsEqualRegion", "ptr", region, "ptr", region2, "ptr", graphics, "ptr", result, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @param {Pointer<UInt32>} bufferSize 
     * @returns {Integer} 
     */
    static GdipGetRegionDataSize(region, bufferSize) {
        result := DllCall("gdiplus.dll\GdipGetRegionDataSize", "ptr", region, "uint*", bufferSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @param {Pointer<Byte>} buffer 
     * @param {Integer} bufferSize 
     * @param {Pointer<UInt32>} sizeFilled 
     * @returns {Integer} 
     */
    static GdipGetRegionData(region, buffer, bufferSize, sizeFilled) {
        result := DllCall("gdiplus.dll\GdipGetRegionData", "ptr", region, "char*", buffer, "uint", bufferSize, "uint*", sizeFilled, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result 
     * @returns {Integer} 
     */
    static GdipIsVisibleRegionPoint(region, x, y, graphics, result) {
        result := DllCall("gdiplus.dll\GdipIsVisibleRegionPoint", "ptr", region, "float", x, "float", y, "ptr", graphics, "ptr", result, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result 
     * @returns {Integer} 
     */
    static GdipIsVisibleRegionPointI(region, x, y, graphics, result) {
        result := DllCall("gdiplus.dll\GdipIsVisibleRegionPointI", "ptr", region, "int", x, "int", y, "ptr", graphics, "ptr", result, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result 
     * @returns {Integer} 
     */
    static GdipIsVisibleRegionRect(region, x, y, width, height, graphics, result) {
        result := DllCall("gdiplus.dll\GdipIsVisibleRegionRect", "ptr", region, "float", x, "float", y, "float", width, "float", height, "ptr", graphics, "ptr", result, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result 
     * @returns {Integer} 
     */
    static GdipIsVisibleRegionRectI(region, x, y, width, height, graphics, result) {
        result := DllCall("gdiplus.dll\GdipIsVisibleRegionRectI", "ptr", region, "int", x, "int", y, "int", width, "int", height, "ptr", graphics, "ptr", result, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @param {Pointer<UInt32>} count 
     * @param {Pointer<Matrix>} matrix 
     * @returns {Integer} 
     */
    static GdipGetRegionScansCount(region, count, matrix) {
        result := DllCall("gdiplus.dll\GdipGetRegionScansCount", "ptr", region, "uint*", count, "ptr", matrix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @param {Pointer<RectF>} rects 
     * @param {Pointer<Int32>} count 
     * @param {Pointer<Matrix>} matrix 
     * @returns {Integer} 
     */
    static GdipGetRegionScans(region, rects, count, matrix) {
        result := DllCall("gdiplus.dll\GdipGetRegionScans", "ptr", region, "ptr", rects, "int*", count, "ptr", matrix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region 
     * @param {Pointer<Rect>} rects 
     * @param {Pointer<Int32>} count 
     * @param {Pointer<Matrix>} matrix 
     * @returns {Integer} 
     */
    static GdipGetRegionScansI(region, rects, count, matrix) {
        result := DllCall("gdiplus.dll\GdipGetRegionScansI", "ptr", region, "ptr", rects, "int*", count, "ptr", matrix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<GpBrush>} cloneBrush 
     * @returns {Integer} 
     */
    static GdipCloneBrush(brush, cloneBrush) {
        result := DllCall("gdiplus.dll\GdipCloneBrush", "ptr", brush, "ptr", cloneBrush, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBrush>} brush 
     * @returns {Integer} 
     */
    static GdipDeleteBrush(brush) {
        result := DllCall("gdiplus.dll\GdipDeleteBrush", "ptr", brush, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<Int32>} type 
     * @returns {Integer} 
     */
    static GdipGetBrushType(brush, type) {
        result := DllCall("gdiplus.dll\GdipGetBrushType", "ptr", brush, "int*", type, "int")
        return result
    }

    /**
     * 
     * @param {Integer} hatchstyle 
     * @param {Integer} forecol 
     * @param {Integer} backcol 
     * @param {Pointer<GpHatch>} brush 
     * @returns {Integer} 
     */
    static GdipCreateHatchBrush(hatchstyle, forecol, backcol, brush) {
        result := DllCall("gdiplus.dll\GdipCreateHatchBrush", "int", hatchstyle, "uint", forecol, "uint", backcol, "ptr", brush, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpHatch>} brush 
     * @param {Pointer<Int32>} hatchstyle 
     * @returns {Integer} 
     */
    static GdipGetHatchStyle(brush, hatchstyle) {
        result := DllCall("gdiplus.dll\GdipGetHatchStyle", "ptr", brush, "int*", hatchstyle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpHatch>} brush 
     * @param {Pointer<UInt32>} forecol 
     * @returns {Integer} 
     */
    static GdipGetHatchForegroundColor(brush, forecol) {
        result := DllCall("gdiplus.dll\GdipGetHatchForegroundColor", "ptr", brush, "uint*", forecol, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpHatch>} brush 
     * @param {Pointer<UInt32>} backcol 
     * @returns {Integer} 
     */
    static GdipGetHatchBackgroundColor(brush, backcol) {
        result := DllCall("gdiplus.dll\GdipGetHatchBackgroundColor", "ptr", brush, "uint*", backcol, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Integer} wrapmode 
     * @param {Pointer<GpTexture>} texture 
     * @returns {Integer} 
     */
    static GdipCreateTexture(image, wrapmode, texture) {
        result := DllCall("gdiplus.dll\GdipCreateTexture", "ptr", image, "int", wrapmode, "ptr", texture, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Integer} wrapmode 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @param {Pointer<GpTexture>} texture 
     * @returns {Integer} 
     */
    static GdipCreateTexture2(image, wrapmode, x, y, width, height, texture) {
        result := DllCall("gdiplus.dll\GdipCreateTexture2", "ptr", image, "int", wrapmode, "float", x, "float", y, "float", width, "float", height, "ptr", texture, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @param {Pointer<GpTexture>} texture 
     * @returns {Integer} 
     */
    static GdipCreateTextureIA(image, imageAttributes, x, y, width, height, texture) {
        result := DllCall("gdiplus.dll\GdipCreateTextureIA", "ptr", image, "ptr", imageAttributes, "float", x, "float", y, "float", width, "float", height, "ptr", texture, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Integer} wrapmode 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Pointer<GpTexture>} texture 
     * @returns {Integer} 
     */
    static GdipCreateTexture2I(image, wrapmode, x, y, width, height, texture) {
        result := DllCall("gdiplus.dll\GdipCreateTexture2I", "ptr", image, "int", wrapmode, "int", x, "int", y, "int", width, "int", height, "ptr", texture, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Pointer<GpTexture>} texture 
     * @returns {Integer} 
     */
    static GdipCreateTextureIAI(image, imageAttributes, x, y, width, height, texture) {
        result := DllCall("gdiplus.dll\GdipCreateTextureIAI", "ptr", image, "ptr", imageAttributes, "int", x, "int", y, "int", width, "int", height, "ptr", texture, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpTexture>} brush 
     * @param {Pointer<Matrix>} matrix 
     * @returns {Integer} 
     */
    static GdipGetTextureTransform(brush, matrix) {
        result := DllCall("gdiplus.dll\GdipGetTextureTransform", "ptr", brush, "ptr", matrix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpTexture>} brush 
     * @param {Pointer<Matrix>} matrix 
     * @returns {Integer} 
     */
    static GdipSetTextureTransform(brush, matrix) {
        result := DllCall("gdiplus.dll\GdipSetTextureTransform", "ptr", brush, "ptr", matrix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpTexture>} brush 
     * @returns {Integer} 
     */
    static GdipResetTextureTransform(brush) {
        result := DllCall("gdiplus.dll\GdipResetTextureTransform", "ptr", brush, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpTexture>} brush 
     * @param {Pointer<Matrix>} matrix 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipMultiplyTextureTransform(brush, matrix, order) {
        result := DllCall("gdiplus.dll\GdipMultiplyTextureTransform", "ptr", brush, "ptr", matrix, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpTexture>} brush 
     * @param {Float} dx 
     * @param {Float} dy 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipTranslateTextureTransform(brush, dx, dy, order) {
        result := DllCall("gdiplus.dll\GdipTranslateTextureTransform", "ptr", brush, "float", dx, "float", dy, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpTexture>} brush 
     * @param {Float} sx 
     * @param {Float} sy 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipScaleTextureTransform(brush, sx, sy, order) {
        result := DllCall("gdiplus.dll\GdipScaleTextureTransform", "ptr", brush, "float", sx, "float", sy, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpTexture>} brush 
     * @param {Float} angle 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipRotateTextureTransform(brush, angle, order) {
        result := DllCall("gdiplus.dll\GdipRotateTextureTransform", "ptr", brush, "float", angle, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpTexture>} brush 
     * @param {Integer} wrapmode 
     * @returns {Integer} 
     */
    static GdipSetTextureWrapMode(brush, wrapmode) {
        result := DllCall("gdiplus.dll\GdipSetTextureWrapMode", "ptr", brush, "int", wrapmode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpTexture>} brush 
     * @param {Pointer<Int32>} wrapmode 
     * @returns {Integer} 
     */
    static GdipGetTextureWrapMode(brush, wrapmode) {
        result := DllCall("gdiplus.dll\GdipGetTextureWrapMode", "ptr", brush, "int*", wrapmode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpTexture>} brush 
     * @param {Pointer<GpImage>} image 
     * @returns {Integer} 
     */
    static GdipGetTextureImage(brush, image) {
        result := DllCall("gdiplus.dll\GdipGetTextureImage", "ptr", brush, "ptr", image, "int")
        return result
    }

    /**
     * 
     * @param {Integer} color 
     * @param {Pointer<GpSolidFill>} brush 
     * @returns {Integer} 
     */
    static GdipCreateSolidFill(color, brush) {
        result := DllCall("gdiplus.dll\GdipCreateSolidFill", "uint", color, "ptr", brush, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpSolidFill>} brush 
     * @param {Integer} color 
     * @returns {Integer} 
     */
    static GdipSetSolidFillColor(brush, color) {
        result := DllCall("gdiplus.dll\GdipSetSolidFillColor", "ptr", brush, "uint", color, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpSolidFill>} brush 
     * @param {Pointer<UInt32>} color 
     * @returns {Integer} 
     */
    static GdipGetSolidFillColor(brush, color) {
        result := DllCall("gdiplus.dll\GdipGetSolidFillColor", "ptr", brush, "uint*", color, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PointF>} point1 
     * @param {Pointer<PointF>} point2 
     * @param {Integer} color1 
     * @param {Integer} color2 
     * @param {Integer} wrapMode 
     * @param {Pointer<GpLineGradient>} lineGradient 
     * @returns {Integer} 
     */
    static GdipCreateLineBrush(point1, point2, color1, color2, wrapMode, lineGradient) {
        result := DllCall("gdiplus.dll\GdipCreateLineBrush", "ptr", point1, "ptr", point2, "uint", color1, "uint", color2, "int", wrapMode, "ptr", lineGradient, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Point>} point1 
     * @param {Pointer<Point>} point2 
     * @param {Integer} color1 
     * @param {Integer} color2 
     * @param {Integer} wrapMode 
     * @param {Pointer<GpLineGradient>} lineGradient 
     * @returns {Integer} 
     */
    static GdipCreateLineBrushI(point1, point2, color1, color2, wrapMode, lineGradient) {
        result := DllCall("gdiplus.dll\GdipCreateLineBrushI", "ptr", point1, "ptr", point2, "uint", color1, "uint", color2, "int", wrapMode, "ptr", lineGradient, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RectF>} rect 
     * @param {Integer} color1 
     * @param {Integer} color2 
     * @param {Integer} mode 
     * @param {Integer} wrapMode 
     * @param {Pointer<GpLineGradient>} lineGradient 
     * @returns {Integer} 
     */
    static GdipCreateLineBrushFromRect(rect, color1, color2, mode, wrapMode, lineGradient) {
        result := DllCall("gdiplus.dll\GdipCreateLineBrushFromRect", "ptr", rect, "uint", color1, "uint", color2, "int", mode, "int", wrapMode, "ptr", lineGradient, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Rect>} rect 
     * @param {Integer} color1 
     * @param {Integer} color2 
     * @param {Integer} mode 
     * @param {Integer} wrapMode 
     * @param {Pointer<GpLineGradient>} lineGradient 
     * @returns {Integer} 
     */
    static GdipCreateLineBrushFromRectI(rect, color1, color2, mode, wrapMode, lineGradient) {
        result := DllCall("gdiplus.dll\GdipCreateLineBrushFromRectI", "ptr", rect, "uint", color1, "uint", color2, "int", mode, "int", wrapMode, "ptr", lineGradient, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RectF>} rect 
     * @param {Integer} color1 
     * @param {Integer} color2 
     * @param {Float} angle 
     * @param {BOOL} isAngleScalable 
     * @param {Integer} wrapMode 
     * @param {Pointer<GpLineGradient>} lineGradient 
     * @returns {Integer} 
     */
    static GdipCreateLineBrushFromRectWithAngle(rect, color1, color2, angle, isAngleScalable, wrapMode, lineGradient) {
        result := DllCall("gdiplus.dll\GdipCreateLineBrushFromRectWithAngle", "ptr", rect, "uint", color1, "uint", color2, "float", angle, "int", isAngleScalable, "int", wrapMode, "ptr", lineGradient, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Rect>} rect 
     * @param {Integer} color1 
     * @param {Integer} color2 
     * @param {Float} angle 
     * @param {BOOL} isAngleScalable 
     * @param {Integer} wrapMode 
     * @param {Pointer<GpLineGradient>} lineGradient 
     * @returns {Integer} 
     */
    static GdipCreateLineBrushFromRectWithAngleI(rect, color1, color2, angle, isAngleScalable, wrapMode, lineGradient) {
        result := DllCall("gdiplus.dll\GdipCreateLineBrushFromRectWithAngleI", "ptr", rect, "uint", color1, "uint", color2, "float", angle, "int", isAngleScalable, "int", wrapMode, "ptr", lineGradient, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Integer} color1 
     * @param {Integer} color2 
     * @returns {Integer} 
     */
    static GdipSetLineColors(brush, color1, color2) {
        result := DllCall("gdiplus.dll\GdipSetLineColors", "ptr", brush, "uint", color1, "uint", color2, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<UInt32>} colors 
     * @returns {Integer} 
     */
    static GdipGetLineColors(brush, colors) {
        result := DllCall("gdiplus.dll\GdipGetLineColors", "ptr", brush, "uint*", colors, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<RectF>} rect 
     * @returns {Integer} 
     */
    static GdipGetLineRect(brush, rect) {
        result := DllCall("gdiplus.dll\GdipGetLineRect", "ptr", brush, "ptr", rect, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<Rect>} rect 
     * @returns {Integer} 
     */
    static GdipGetLineRectI(brush, rect) {
        result := DllCall("gdiplus.dll\GdipGetLineRectI", "ptr", brush, "ptr", rect, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {BOOL} useGammaCorrection 
     * @returns {Integer} 
     */
    static GdipSetLineGammaCorrection(brush, useGammaCorrection) {
        result := DllCall("gdiplus.dll\GdipSetLineGammaCorrection", "ptr", brush, "int", useGammaCorrection, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<BOOL>} useGammaCorrection 
     * @returns {Integer} 
     */
    static GdipGetLineGammaCorrection(brush, useGammaCorrection) {
        result := DllCall("gdiplus.dll\GdipGetLineGammaCorrection", "ptr", brush, "ptr", useGammaCorrection, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<Int32>} count 
     * @returns {Integer} 
     */
    static GdipGetLineBlendCount(brush, count) {
        result := DllCall("gdiplus.dll\GdipGetLineBlendCount", "ptr", brush, "int*", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<Single>} blend 
     * @param {Pointer<Single>} positions 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipGetLineBlend(brush, blend, positions, count) {
        result := DllCall("gdiplus.dll\GdipGetLineBlend", "ptr", brush, "float*", blend, "float*", positions, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<Single>} blend 
     * @param {Pointer<Single>} positions 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipSetLineBlend(brush, blend, positions, count) {
        result := DllCall("gdiplus.dll\GdipSetLineBlend", "ptr", brush, "float*", blend, "float*", positions, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<Int32>} count 
     * @returns {Integer} 
     */
    static GdipGetLinePresetBlendCount(brush, count) {
        result := DllCall("gdiplus.dll\GdipGetLinePresetBlendCount", "ptr", brush, "int*", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<UInt32>} blend 
     * @param {Pointer<Single>} positions 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipGetLinePresetBlend(brush, blend, positions, count) {
        result := DllCall("gdiplus.dll\GdipGetLinePresetBlend", "ptr", brush, "uint*", blend, "float*", positions, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<UInt32>} blend 
     * @param {Pointer<Single>} positions 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipSetLinePresetBlend(brush, blend, positions, count) {
        result := DllCall("gdiplus.dll\GdipSetLinePresetBlend", "ptr", brush, "uint*", blend, "float*", positions, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Float} focus 
     * @param {Float} scale 
     * @returns {Integer} 
     */
    static GdipSetLineSigmaBlend(brush, focus, scale) {
        result := DllCall("gdiplus.dll\GdipSetLineSigmaBlend", "ptr", brush, "float", focus, "float", scale, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Float} focus 
     * @param {Float} scale 
     * @returns {Integer} 
     */
    static GdipSetLineLinearBlend(brush, focus, scale) {
        result := DllCall("gdiplus.dll\GdipSetLineLinearBlend", "ptr", brush, "float", focus, "float", scale, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Integer} wrapmode 
     * @returns {Integer} 
     */
    static GdipSetLineWrapMode(brush, wrapmode) {
        result := DllCall("gdiplus.dll\GdipSetLineWrapMode", "ptr", brush, "int", wrapmode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<Int32>} wrapmode 
     * @returns {Integer} 
     */
    static GdipGetLineWrapMode(brush, wrapmode) {
        result := DllCall("gdiplus.dll\GdipGetLineWrapMode", "ptr", brush, "int*", wrapmode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<Matrix>} matrix 
     * @returns {Integer} 
     */
    static GdipGetLineTransform(brush, matrix) {
        result := DllCall("gdiplus.dll\GdipGetLineTransform", "ptr", brush, "ptr", matrix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<Matrix>} matrix 
     * @returns {Integer} 
     */
    static GdipSetLineTransform(brush, matrix) {
        result := DllCall("gdiplus.dll\GdipSetLineTransform", "ptr", brush, "ptr", matrix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @returns {Integer} 
     */
    static GdipResetLineTransform(brush) {
        result := DllCall("gdiplus.dll\GdipResetLineTransform", "ptr", brush, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<Matrix>} matrix 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipMultiplyLineTransform(brush, matrix, order) {
        result := DllCall("gdiplus.dll\GdipMultiplyLineTransform", "ptr", brush, "ptr", matrix, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Float} dx 
     * @param {Float} dy 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipTranslateLineTransform(brush, dx, dy, order) {
        result := DllCall("gdiplus.dll\GdipTranslateLineTransform", "ptr", brush, "float", dx, "float", dy, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Float} sx 
     * @param {Float} sy 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipScaleLineTransform(brush, sx, sy, order) {
        result := DllCall("gdiplus.dll\GdipScaleLineTransform", "ptr", brush, "float", sx, "float", sy, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Float} angle 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipRotateLineTransform(brush, angle, order) {
        result := DllCall("gdiplus.dll\GdipRotateLineTransform", "ptr", brush, "float", angle, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @param {Integer} wrapMode 
     * @param {Pointer<GpPathGradient>} polyGradient 
     * @returns {Integer} 
     */
    static GdipCreatePathGradient(points, count, wrapMode, polyGradient) {
        result := DllCall("gdiplus.dll\GdipCreatePathGradient", "ptr", points, "int", count, "int", wrapMode, "ptr", polyGradient, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @param {Integer} wrapMode 
     * @param {Pointer<GpPathGradient>} polyGradient 
     * @returns {Integer} 
     */
    static GdipCreatePathGradientI(points, count, wrapMode, polyGradient) {
        result := DllCall("gdiplus.dll\GdipCreatePathGradientI", "ptr", points, "int", count, "int", wrapMode, "ptr", polyGradient, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path 
     * @param {Pointer<GpPathGradient>} polyGradient 
     * @returns {Integer} 
     */
    static GdipCreatePathGradientFromPath(path, polyGradient) {
        result := DllCall("gdiplus.dll\GdipCreatePathGradientFromPath", "ptr", path, "ptr", polyGradient, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<UInt32>} colors 
     * @returns {Integer} 
     */
    static GdipGetPathGradientCenterColor(brush, colors) {
        result := DllCall("gdiplus.dll\GdipGetPathGradientCenterColor", "ptr", brush, "uint*", colors, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Integer} colors 
     * @returns {Integer} 
     */
    static GdipSetPathGradientCenterColor(brush, colors) {
        result := DllCall("gdiplus.dll\GdipSetPathGradientCenterColor", "ptr", brush, "uint", colors, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<UInt32>} color 
     * @param {Pointer<Int32>} count 
     * @returns {Integer} 
     */
    static GdipGetPathGradientSurroundColorsWithCount(brush, color, count) {
        result := DllCall("gdiplus.dll\GdipGetPathGradientSurroundColorsWithCount", "ptr", brush, "uint*", color, "int*", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<UInt32>} color 
     * @param {Pointer<Int32>} count 
     * @returns {Integer} 
     */
    static GdipSetPathGradientSurroundColorsWithCount(brush, color, count) {
        result := DllCall("gdiplus.dll\GdipSetPathGradientSurroundColorsWithCount", "ptr", brush, "uint*", color, "int*", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<GpPath>} path 
     * @returns {Integer} 
     */
    static GdipGetPathGradientPath(brush, path) {
        result := DllCall("gdiplus.dll\GdipGetPathGradientPath", "ptr", brush, "ptr", path, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<GpPath>} path 
     * @returns {Integer} 
     */
    static GdipSetPathGradientPath(brush, path) {
        result := DllCall("gdiplus.dll\GdipSetPathGradientPath", "ptr", brush, "ptr", path, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<PointF>} points 
     * @returns {Integer} 
     */
    static GdipGetPathGradientCenterPoint(brush, points) {
        result := DllCall("gdiplus.dll\GdipGetPathGradientCenterPoint", "ptr", brush, "ptr", points, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Point>} points 
     * @returns {Integer} 
     */
    static GdipGetPathGradientCenterPointI(brush, points) {
        result := DllCall("gdiplus.dll\GdipGetPathGradientCenterPointI", "ptr", brush, "ptr", points, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<PointF>} points 
     * @returns {Integer} 
     */
    static GdipSetPathGradientCenterPoint(brush, points) {
        result := DllCall("gdiplus.dll\GdipSetPathGradientCenterPoint", "ptr", brush, "ptr", points, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Point>} points 
     * @returns {Integer} 
     */
    static GdipSetPathGradientCenterPointI(brush, points) {
        result := DllCall("gdiplus.dll\GdipSetPathGradientCenterPointI", "ptr", brush, "ptr", points, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<RectF>} rect 
     * @returns {Integer} 
     */
    static GdipGetPathGradientRect(brush, rect) {
        result := DllCall("gdiplus.dll\GdipGetPathGradientRect", "ptr", brush, "ptr", rect, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Rect>} rect 
     * @returns {Integer} 
     */
    static GdipGetPathGradientRectI(brush, rect) {
        result := DllCall("gdiplus.dll\GdipGetPathGradientRectI", "ptr", brush, "ptr", rect, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Int32>} count 
     * @returns {Integer} 
     */
    static GdipGetPathGradientPointCount(brush, count) {
        result := DllCall("gdiplus.dll\GdipGetPathGradientPointCount", "ptr", brush, "int*", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Int32>} count 
     * @returns {Integer} 
     */
    static GdipGetPathGradientSurroundColorCount(brush, count) {
        result := DllCall("gdiplus.dll\GdipGetPathGradientSurroundColorCount", "ptr", brush, "int*", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {BOOL} useGammaCorrection 
     * @returns {Integer} 
     */
    static GdipSetPathGradientGammaCorrection(brush, useGammaCorrection) {
        result := DllCall("gdiplus.dll\GdipSetPathGradientGammaCorrection", "ptr", brush, "int", useGammaCorrection, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<BOOL>} useGammaCorrection 
     * @returns {Integer} 
     */
    static GdipGetPathGradientGammaCorrection(brush, useGammaCorrection) {
        result := DllCall("gdiplus.dll\GdipGetPathGradientGammaCorrection", "ptr", brush, "ptr", useGammaCorrection, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Int32>} count 
     * @returns {Integer} 
     */
    static GdipGetPathGradientBlendCount(brush, count) {
        result := DllCall("gdiplus.dll\GdipGetPathGradientBlendCount", "ptr", brush, "int*", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Single>} blend 
     * @param {Pointer<Single>} positions 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipGetPathGradientBlend(brush, blend, positions, count) {
        result := DllCall("gdiplus.dll\GdipGetPathGradientBlend", "ptr", brush, "float*", blend, "float*", positions, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Single>} blend 
     * @param {Pointer<Single>} positions 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipSetPathGradientBlend(brush, blend, positions, count) {
        result := DllCall("gdiplus.dll\GdipSetPathGradientBlend", "ptr", brush, "float*", blend, "float*", positions, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Int32>} count 
     * @returns {Integer} 
     */
    static GdipGetPathGradientPresetBlendCount(brush, count) {
        result := DllCall("gdiplus.dll\GdipGetPathGradientPresetBlendCount", "ptr", brush, "int*", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<UInt32>} blend 
     * @param {Pointer<Single>} positions 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipGetPathGradientPresetBlend(brush, blend, positions, count) {
        result := DllCall("gdiplus.dll\GdipGetPathGradientPresetBlend", "ptr", brush, "uint*", blend, "float*", positions, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<UInt32>} blend 
     * @param {Pointer<Single>} positions 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipSetPathGradientPresetBlend(brush, blend, positions, count) {
        result := DllCall("gdiplus.dll\GdipSetPathGradientPresetBlend", "ptr", brush, "uint*", blend, "float*", positions, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Float} focus 
     * @param {Float} scale 
     * @returns {Integer} 
     */
    static GdipSetPathGradientSigmaBlend(brush, focus, scale) {
        result := DllCall("gdiplus.dll\GdipSetPathGradientSigmaBlend", "ptr", brush, "float", focus, "float", scale, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Float} focus 
     * @param {Float} scale 
     * @returns {Integer} 
     */
    static GdipSetPathGradientLinearBlend(brush, focus, scale) {
        result := DllCall("gdiplus.dll\GdipSetPathGradientLinearBlend", "ptr", brush, "float", focus, "float", scale, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Int32>} wrapmode 
     * @returns {Integer} 
     */
    static GdipGetPathGradientWrapMode(brush, wrapmode) {
        result := DllCall("gdiplus.dll\GdipGetPathGradientWrapMode", "ptr", brush, "int*", wrapmode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Integer} wrapmode 
     * @returns {Integer} 
     */
    static GdipSetPathGradientWrapMode(brush, wrapmode) {
        result := DllCall("gdiplus.dll\GdipSetPathGradientWrapMode", "ptr", brush, "int", wrapmode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Matrix>} matrix 
     * @returns {Integer} 
     */
    static GdipGetPathGradientTransform(brush, matrix) {
        result := DllCall("gdiplus.dll\GdipGetPathGradientTransform", "ptr", brush, "ptr", matrix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Matrix>} matrix 
     * @returns {Integer} 
     */
    static GdipSetPathGradientTransform(brush, matrix) {
        result := DllCall("gdiplus.dll\GdipSetPathGradientTransform", "ptr", brush, "ptr", matrix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @returns {Integer} 
     */
    static GdipResetPathGradientTransform(brush) {
        result := DllCall("gdiplus.dll\GdipResetPathGradientTransform", "ptr", brush, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Matrix>} matrix 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipMultiplyPathGradientTransform(brush, matrix, order) {
        result := DllCall("gdiplus.dll\GdipMultiplyPathGradientTransform", "ptr", brush, "ptr", matrix, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Float} dx 
     * @param {Float} dy 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipTranslatePathGradientTransform(brush, dx, dy, order) {
        result := DllCall("gdiplus.dll\GdipTranslatePathGradientTransform", "ptr", brush, "float", dx, "float", dy, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Float} sx 
     * @param {Float} sy 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipScalePathGradientTransform(brush, sx, sy, order) {
        result := DllCall("gdiplus.dll\GdipScalePathGradientTransform", "ptr", brush, "float", sx, "float", sy, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Float} angle 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipRotatePathGradientTransform(brush, angle, order) {
        result := DllCall("gdiplus.dll\GdipRotatePathGradientTransform", "ptr", brush, "float", angle, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Single>} xScale 
     * @param {Pointer<Single>} yScale 
     * @returns {Integer} 
     */
    static GdipGetPathGradientFocusScales(brush, xScale, yScale) {
        result := DllCall("gdiplus.dll\GdipGetPathGradientFocusScales", "ptr", brush, "float*", xScale, "float*", yScale, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Float} xScale 
     * @param {Float} yScale 
     * @returns {Integer} 
     */
    static GdipSetPathGradientFocusScales(brush, xScale, yScale) {
        result := DllCall("gdiplus.dll\GdipSetPathGradientFocusScales", "ptr", brush, "float", xScale, "float", yScale, "int")
        return result
    }

    /**
     * 
     * @param {Integer} color 
     * @param {Float} width 
     * @param {Integer} unit 
     * @param {Pointer<GpPen>} pen 
     * @returns {Integer} 
     */
    static GdipCreatePen1(color, width, unit, pen) {
        result := DllCall("gdiplus.dll\GdipCreatePen1", "uint", color, "float", width, "int", unit, "ptr", pen, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBrush>} brush 
     * @param {Float} width 
     * @param {Integer} unit 
     * @param {Pointer<GpPen>} pen 
     * @returns {Integer} 
     */
    static GdipCreatePen2(brush, width, unit, pen) {
        result := DllCall("gdiplus.dll\GdipCreatePen2", "ptr", brush, "float", width, "int", unit, "ptr", pen, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<GpPen>} clonepen 
     * @returns {Integer} 
     */
    static GdipClonePen(pen, clonepen) {
        result := DllCall("gdiplus.dll\GdipClonePen", "ptr", pen, "ptr", clonepen, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @returns {Integer} 
     */
    static GdipDeletePen(pen) {
        result := DllCall("gdiplus.dll\GdipDeletePen", "ptr", pen, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Float} width 
     * @returns {Integer} 
     */
    static GdipSetPenWidth(pen, width) {
        result := DllCall("gdiplus.dll\GdipSetPenWidth", "ptr", pen, "float", width, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Single>} width 
     * @returns {Integer} 
     */
    static GdipGetPenWidth(pen, width) {
        result := DllCall("gdiplus.dll\GdipGetPenWidth", "ptr", pen, "float*", width, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Integer} unit 
     * @returns {Integer} 
     */
    static GdipSetPenUnit(pen, unit) {
        result := DllCall("gdiplus.dll\GdipSetPenUnit", "ptr", pen, "int", unit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Int32>} unit 
     * @returns {Integer} 
     */
    static GdipGetPenUnit(pen, unit) {
        result := DllCall("gdiplus.dll\GdipGetPenUnit", "ptr", pen, "int*", unit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Integer} startCap 
     * @param {Integer} endCap 
     * @param {Integer} dashCap 
     * @returns {Integer} 
     */
    static GdipSetPenLineCap197819(pen, startCap, endCap, dashCap) {
        result := DllCall("gdiplus.dll\GdipSetPenLineCap197819", "ptr", pen, "int", startCap, "int", endCap, "int", dashCap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Integer} startCap 
     * @returns {Integer} 
     */
    static GdipSetPenStartCap(pen, startCap) {
        result := DllCall("gdiplus.dll\GdipSetPenStartCap", "ptr", pen, "int", startCap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Integer} endCap 
     * @returns {Integer} 
     */
    static GdipSetPenEndCap(pen, endCap) {
        result := DllCall("gdiplus.dll\GdipSetPenEndCap", "ptr", pen, "int", endCap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Integer} dashCap 
     * @returns {Integer} 
     */
    static GdipSetPenDashCap197819(pen, dashCap) {
        result := DllCall("gdiplus.dll\GdipSetPenDashCap197819", "ptr", pen, "int", dashCap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Int32>} startCap 
     * @returns {Integer} 
     */
    static GdipGetPenStartCap(pen, startCap) {
        result := DllCall("gdiplus.dll\GdipGetPenStartCap", "ptr", pen, "int*", startCap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Int32>} endCap 
     * @returns {Integer} 
     */
    static GdipGetPenEndCap(pen, endCap) {
        result := DllCall("gdiplus.dll\GdipGetPenEndCap", "ptr", pen, "int*", endCap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Int32>} dashCap 
     * @returns {Integer} 
     */
    static GdipGetPenDashCap197819(pen, dashCap) {
        result := DllCall("gdiplus.dll\GdipGetPenDashCap197819", "ptr", pen, "int*", dashCap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Integer} lineJoin 
     * @returns {Integer} 
     */
    static GdipSetPenLineJoin(pen, lineJoin) {
        result := DllCall("gdiplus.dll\GdipSetPenLineJoin", "ptr", pen, "int", lineJoin, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Int32>} lineJoin 
     * @returns {Integer} 
     */
    static GdipGetPenLineJoin(pen, lineJoin) {
        result := DllCall("gdiplus.dll\GdipGetPenLineJoin", "ptr", pen, "int*", lineJoin, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<GpCustomLineCap>} customCap 
     * @returns {Integer} 
     */
    static GdipSetPenCustomStartCap(pen, customCap) {
        result := DllCall("gdiplus.dll\GdipSetPenCustomStartCap", "ptr", pen, "ptr", customCap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<GpCustomLineCap>} customCap 
     * @returns {Integer} 
     */
    static GdipGetPenCustomStartCap(pen, customCap) {
        result := DllCall("gdiplus.dll\GdipGetPenCustomStartCap", "ptr", pen, "ptr", customCap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<GpCustomLineCap>} customCap 
     * @returns {Integer} 
     */
    static GdipSetPenCustomEndCap(pen, customCap) {
        result := DllCall("gdiplus.dll\GdipSetPenCustomEndCap", "ptr", pen, "ptr", customCap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<GpCustomLineCap>} customCap 
     * @returns {Integer} 
     */
    static GdipGetPenCustomEndCap(pen, customCap) {
        result := DllCall("gdiplus.dll\GdipGetPenCustomEndCap", "ptr", pen, "ptr", customCap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Float} miterLimit 
     * @returns {Integer} 
     */
    static GdipSetPenMiterLimit(pen, miterLimit) {
        result := DllCall("gdiplus.dll\GdipSetPenMiterLimit", "ptr", pen, "float", miterLimit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Single>} miterLimit 
     * @returns {Integer} 
     */
    static GdipGetPenMiterLimit(pen, miterLimit) {
        result := DllCall("gdiplus.dll\GdipGetPenMiterLimit", "ptr", pen, "float*", miterLimit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Integer} penMode 
     * @returns {Integer} 
     */
    static GdipSetPenMode(pen, penMode) {
        result := DllCall("gdiplus.dll\GdipSetPenMode", "ptr", pen, "int", penMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Int32>} penMode 
     * @returns {Integer} 
     */
    static GdipGetPenMode(pen, penMode) {
        result := DllCall("gdiplus.dll\GdipGetPenMode", "ptr", pen, "int*", penMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Matrix>} matrix 
     * @returns {Integer} 
     */
    static GdipSetPenTransform(pen, matrix) {
        result := DllCall("gdiplus.dll\GdipSetPenTransform", "ptr", pen, "ptr", matrix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Matrix>} matrix 
     * @returns {Integer} 
     */
    static GdipGetPenTransform(pen, matrix) {
        result := DllCall("gdiplus.dll\GdipGetPenTransform", "ptr", pen, "ptr", matrix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @returns {Integer} 
     */
    static GdipResetPenTransform(pen) {
        result := DllCall("gdiplus.dll\GdipResetPenTransform", "ptr", pen, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Matrix>} matrix 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipMultiplyPenTransform(pen, matrix, order) {
        result := DllCall("gdiplus.dll\GdipMultiplyPenTransform", "ptr", pen, "ptr", matrix, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Float} dx 
     * @param {Float} dy 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipTranslatePenTransform(pen, dx, dy, order) {
        result := DllCall("gdiplus.dll\GdipTranslatePenTransform", "ptr", pen, "float", dx, "float", dy, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Float} sx 
     * @param {Float} sy 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipScalePenTransform(pen, sx, sy, order) {
        result := DllCall("gdiplus.dll\GdipScalePenTransform", "ptr", pen, "float", sx, "float", sy, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Float} angle 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipRotatePenTransform(pen, angle, order) {
        result := DllCall("gdiplus.dll\GdipRotatePenTransform", "ptr", pen, "float", angle, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Integer} argb 
     * @returns {Integer} 
     */
    static GdipSetPenColor(pen, argb) {
        result := DllCall("gdiplus.dll\GdipSetPenColor", "ptr", pen, "uint", argb, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<UInt32>} argb 
     * @returns {Integer} 
     */
    static GdipGetPenColor(pen, argb) {
        result := DllCall("gdiplus.dll\GdipGetPenColor", "ptr", pen, "uint*", argb, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<GpBrush>} brush 
     * @returns {Integer} 
     */
    static GdipSetPenBrushFill(pen, brush) {
        result := DllCall("gdiplus.dll\GdipSetPenBrushFill", "ptr", pen, "ptr", brush, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<GpBrush>} brush 
     * @returns {Integer} 
     */
    static GdipGetPenBrushFill(pen, brush) {
        result := DllCall("gdiplus.dll\GdipGetPenBrushFill", "ptr", pen, "ptr", brush, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Int32>} type 
     * @returns {Integer} 
     */
    static GdipGetPenFillType(pen, type) {
        result := DllCall("gdiplus.dll\GdipGetPenFillType", "ptr", pen, "int*", type, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Int32>} dashstyle 
     * @returns {Integer} 
     */
    static GdipGetPenDashStyle(pen, dashstyle) {
        result := DllCall("gdiplus.dll\GdipGetPenDashStyle", "ptr", pen, "int*", dashstyle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Integer} dashstyle 
     * @returns {Integer} 
     */
    static GdipSetPenDashStyle(pen, dashstyle) {
        result := DllCall("gdiplus.dll\GdipSetPenDashStyle", "ptr", pen, "int", dashstyle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Single>} offset 
     * @returns {Integer} 
     */
    static GdipGetPenDashOffset(pen, offset) {
        result := DllCall("gdiplus.dll\GdipGetPenDashOffset", "ptr", pen, "float*", offset, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Float} offset 
     * @returns {Integer} 
     */
    static GdipSetPenDashOffset(pen, offset) {
        result := DllCall("gdiplus.dll\GdipSetPenDashOffset", "ptr", pen, "float", offset, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Int32>} count 
     * @returns {Integer} 
     */
    static GdipGetPenDashCount(pen, count) {
        result := DllCall("gdiplus.dll\GdipGetPenDashCount", "ptr", pen, "int*", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Single>} dash 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipSetPenDashArray(pen, dash, count) {
        result := DllCall("gdiplus.dll\GdipSetPenDashArray", "ptr", pen, "float*", dash, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Single>} dash 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipGetPenDashArray(pen, dash, count) {
        result := DllCall("gdiplus.dll\GdipGetPenDashArray", "ptr", pen, "float*", dash, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Int32>} count 
     * @returns {Integer} 
     */
    static GdipGetPenCompoundCount(pen, count) {
        result := DllCall("gdiplus.dll\GdipGetPenCompoundCount", "ptr", pen, "int*", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Single>} dash 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipSetPenCompoundArray(pen, dash, count) {
        result := DllCall("gdiplus.dll\GdipSetPenCompoundArray", "ptr", pen, "float*", dash, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Single>} dash 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipGetPenCompoundArray(pen, dash, count) {
        result := DllCall("gdiplus.dll\GdipGetPenCompoundArray", "ptr", pen, "float*", dash, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} fillPath 
     * @param {Pointer<GpPath>} strokePath 
     * @param {Integer} baseCap 
     * @param {Float} baseInset 
     * @param {Pointer<GpCustomLineCap>} customCap 
     * @returns {Integer} 
     */
    static GdipCreateCustomLineCap(fillPath, strokePath, baseCap, baseInset, customCap) {
        result := DllCall("gdiplus.dll\GdipCreateCustomLineCap", "ptr", fillPath, "ptr", strokePath, "int", baseCap, "float", baseInset, "ptr", customCap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpCustomLineCap>} customCap 
     * @returns {Integer} 
     */
    static GdipDeleteCustomLineCap(customCap) {
        result := DllCall("gdiplus.dll\GdipDeleteCustomLineCap", "ptr", customCap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpCustomLineCap>} customCap 
     * @param {Pointer<GpCustomLineCap>} clonedCap 
     * @returns {Integer} 
     */
    static GdipCloneCustomLineCap(customCap, clonedCap) {
        result := DllCall("gdiplus.dll\GdipCloneCustomLineCap", "ptr", customCap, "ptr", clonedCap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpCustomLineCap>} customCap 
     * @param {Pointer<Int32>} capType 
     * @returns {Integer} 
     */
    static GdipGetCustomLineCapType(customCap, capType) {
        result := DllCall("gdiplus.dll\GdipGetCustomLineCapType", "ptr", customCap, "int*", capType, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpCustomLineCap>} customCap 
     * @param {Integer} startCap 
     * @param {Integer} endCap 
     * @returns {Integer} 
     */
    static GdipSetCustomLineCapStrokeCaps(customCap, startCap, endCap) {
        result := DllCall("gdiplus.dll\GdipSetCustomLineCapStrokeCaps", "ptr", customCap, "int", startCap, "int", endCap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpCustomLineCap>} customCap 
     * @param {Pointer<Int32>} startCap 
     * @param {Pointer<Int32>} endCap 
     * @returns {Integer} 
     */
    static GdipGetCustomLineCapStrokeCaps(customCap, startCap, endCap) {
        result := DllCall("gdiplus.dll\GdipGetCustomLineCapStrokeCaps", "ptr", customCap, "int*", startCap, "int*", endCap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpCustomLineCap>} customCap 
     * @param {Integer} lineJoin 
     * @returns {Integer} 
     */
    static GdipSetCustomLineCapStrokeJoin(customCap, lineJoin) {
        result := DllCall("gdiplus.dll\GdipSetCustomLineCapStrokeJoin", "ptr", customCap, "int", lineJoin, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpCustomLineCap>} customCap 
     * @param {Pointer<Int32>} lineJoin 
     * @returns {Integer} 
     */
    static GdipGetCustomLineCapStrokeJoin(customCap, lineJoin) {
        result := DllCall("gdiplus.dll\GdipGetCustomLineCapStrokeJoin", "ptr", customCap, "int*", lineJoin, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpCustomLineCap>} customCap 
     * @param {Integer} baseCap 
     * @returns {Integer} 
     */
    static GdipSetCustomLineCapBaseCap(customCap, baseCap) {
        result := DllCall("gdiplus.dll\GdipSetCustomLineCapBaseCap", "ptr", customCap, "int", baseCap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpCustomLineCap>} customCap 
     * @param {Pointer<Int32>} baseCap 
     * @returns {Integer} 
     */
    static GdipGetCustomLineCapBaseCap(customCap, baseCap) {
        result := DllCall("gdiplus.dll\GdipGetCustomLineCapBaseCap", "ptr", customCap, "int*", baseCap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpCustomLineCap>} customCap 
     * @param {Float} inset 
     * @returns {Integer} 
     */
    static GdipSetCustomLineCapBaseInset(customCap, inset) {
        result := DllCall("gdiplus.dll\GdipSetCustomLineCapBaseInset", "ptr", customCap, "float", inset, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpCustomLineCap>} customCap 
     * @param {Pointer<Single>} inset 
     * @returns {Integer} 
     */
    static GdipGetCustomLineCapBaseInset(customCap, inset) {
        result := DllCall("gdiplus.dll\GdipGetCustomLineCapBaseInset", "ptr", customCap, "float*", inset, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpCustomLineCap>} customCap 
     * @param {Float} widthScale 
     * @returns {Integer} 
     */
    static GdipSetCustomLineCapWidthScale(customCap, widthScale) {
        result := DllCall("gdiplus.dll\GdipSetCustomLineCapWidthScale", "ptr", customCap, "float", widthScale, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpCustomLineCap>} customCap 
     * @param {Pointer<Single>} widthScale 
     * @returns {Integer} 
     */
    static GdipGetCustomLineCapWidthScale(customCap, widthScale) {
        result := DllCall("gdiplus.dll\GdipGetCustomLineCapWidthScale", "ptr", customCap, "float*", widthScale, "int")
        return result
    }

    /**
     * 
     * @param {Float} height 
     * @param {Float} width 
     * @param {BOOL} isFilled 
     * @param {Pointer<GpAdjustableArrowCap>} cap 
     * @returns {Integer} 
     */
    static GdipCreateAdjustableArrowCap(height, width, isFilled, cap) {
        result := DllCall("gdiplus.dll\GdipCreateAdjustableArrowCap", "float", height, "float", width, "int", isFilled, "ptr", cap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpAdjustableArrowCap>} cap 
     * @param {Float} height 
     * @returns {Integer} 
     */
    static GdipSetAdjustableArrowCapHeight(cap, height) {
        result := DllCall("gdiplus.dll\GdipSetAdjustableArrowCapHeight", "ptr", cap, "float", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpAdjustableArrowCap>} cap 
     * @param {Pointer<Single>} height 
     * @returns {Integer} 
     */
    static GdipGetAdjustableArrowCapHeight(cap, height) {
        result := DllCall("gdiplus.dll\GdipGetAdjustableArrowCapHeight", "ptr", cap, "float*", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpAdjustableArrowCap>} cap 
     * @param {Float} width 
     * @returns {Integer} 
     */
    static GdipSetAdjustableArrowCapWidth(cap, width) {
        result := DllCall("gdiplus.dll\GdipSetAdjustableArrowCapWidth", "ptr", cap, "float", width, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpAdjustableArrowCap>} cap 
     * @param {Pointer<Single>} width 
     * @returns {Integer} 
     */
    static GdipGetAdjustableArrowCapWidth(cap, width) {
        result := DllCall("gdiplus.dll\GdipGetAdjustableArrowCapWidth", "ptr", cap, "float*", width, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpAdjustableArrowCap>} cap 
     * @param {Float} middleInset 
     * @returns {Integer} 
     */
    static GdipSetAdjustableArrowCapMiddleInset(cap, middleInset) {
        result := DllCall("gdiplus.dll\GdipSetAdjustableArrowCapMiddleInset", "ptr", cap, "float", middleInset, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpAdjustableArrowCap>} cap 
     * @param {Pointer<Single>} middleInset 
     * @returns {Integer} 
     */
    static GdipGetAdjustableArrowCapMiddleInset(cap, middleInset) {
        result := DllCall("gdiplus.dll\GdipGetAdjustableArrowCapMiddleInset", "ptr", cap, "float*", middleInset, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpAdjustableArrowCap>} cap 
     * @param {BOOL} fillState 
     * @returns {Integer} 
     */
    static GdipSetAdjustableArrowCapFillState(cap, fillState) {
        result := DllCall("gdiplus.dll\GdipSetAdjustableArrowCapFillState", "ptr", cap, "int", fillState, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpAdjustableArrowCap>} cap 
     * @param {Pointer<BOOL>} fillState 
     * @returns {Integer} 
     */
    static GdipGetAdjustableArrowCapFillState(cap, fillState) {
        result := DllCall("gdiplus.dll\GdipGetAdjustableArrowCapFillState", "ptr", cap, "ptr", fillState, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} stream 
     * @param {Pointer<GpImage>} image 
     * @returns {Integer} 
     */
    static GdipLoadImageFromStream(stream, image) {
        result := DllCall("gdiplus.dll\GdipLoadImageFromStream", "ptr", stream, "ptr", image, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} filename 
     * @param {Pointer<GpImage>} image 
     * @returns {Integer} 
     */
    static GdipLoadImageFromFile(filename, image) {
        filename := filename is String ? StrPtr(filename) : filename

        result := DllCall("gdiplus.dll\GdipLoadImageFromFile", "ptr", filename, "ptr", image, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} stream 
     * @param {Pointer<GpImage>} image 
     * @returns {Integer} 
     */
    static GdipLoadImageFromStreamICM(stream, image) {
        result := DllCall("gdiplus.dll\GdipLoadImageFromStreamICM", "ptr", stream, "ptr", image, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} filename 
     * @param {Pointer<GpImage>} image 
     * @returns {Integer} 
     */
    static GdipLoadImageFromFileICM(filename, image) {
        filename := filename is String ? StrPtr(filename) : filename

        result := DllCall("gdiplus.dll\GdipLoadImageFromFileICM", "ptr", filename, "ptr", image, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<GpImage>} cloneImage 
     * @returns {Integer} 
     */
    static GdipCloneImage(image, cloneImage) {
        result := DllCall("gdiplus.dll\GdipCloneImage", "ptr", image, "ptr", cloneImage, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @returns {Integer} 
     */
    static GdipDisposeImage(image) {
        result := DllCall("gdiplus.dll\GdipDisposeImage", "ptr", image, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {PWSTR} filename 
     * @param {Pointer<Guid>} clsidEncoder 
     * @param {Pointer<EncoderParameters>} encoderParams 
     * @returns {Integer} 
     */
    static GdipSaveImageToFile(image, filename, clsidEncoder, encoderParams) {
        filename := filename is String ? StrPtr(filename) : filename

        result := DllCall("gdiplus.dll\GdipSaveImageToFile", "ptr", image, "ptr", filename, "ptr", clsidEncoder, "ptr", encoderParams, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<IStream>} stream 
     * @param {Pointer<Guid>} clsidEncoder 
     * @param {Pointer<EncoderParameters>} encoderParams 
     * @returns {Integer} 
     */
    static GdipSaveImageToStream(image, stream, clsidEncoder, encoderParams) {
        result := DllCall("gdiplus.dll\GdipSaveImageToStream", "ptr", image, "ptr", stream, "ptr", clsidEncoder, "ptr", encoderParams, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<EncoderParameters>} encoderParams 
     * @returns {Integer} 
     */
    static GdipSaveAdd(image, encoderParams) {
        result := DllCall("gdiplus.dll\GdipSaveAdd", "ptr", image, "ptr", encoderParams, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<GpImage>} newImage 
     * @param {Pointer<EncoderParameters>} encoderParams 
     * @returns {Integer} 
     */
    static GdipSaveAddImage(image, newImage, encoderParams) {
        result := DllCall("gdiplus.dll\GdipSaveAddImage", "ptr", image, "ptr", newImage, "ptr", encoderParams, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<GpGraphics>} graphics 
     * @returns {Integer} 
     */
    static GdipGetImageGraphicsContext(image, graphics) {
        result := DllCall("gdiplus.dll\GdipGetImageGraphicsContext", "ptr", image, "ptr", graphics, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<RectF>} srcRect 
     * @param {Pointer<Int32>} srcUnit 
     * @returns {Integer} 
     */
    static GdipGetImageBounds(image, srcRect, srcUnit) {
        result := DllCall("gdiplus.dll\GdipGetImageBounds", "ptr", image, "ptr", srcRect, "int*", srcUnit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<Single>} width 
     * @param {Pointer<Single>} height 
     * @returns {Integer} 
     */
    static GdipGetImageDimension(image, width, height) {
        result := DllCall("gdiplus.dll\GdipGetImageDimension", "ptr", image, "float*", width, "float*", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<Int32>} type 
     * @returns {Integer} 
     */
    static GdipGetImageType(image, type) {
        result := DllCall("gdiplus.dll\GdipGetImageType", "ptr", image, "int*", type, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<UInt32>} width 
     * @returns {Integer} 
     */
    static GdipGetImageWidth(image, width) {
        result := DllCall("gdiplus.dll\GdipGetImageWidth", "ptr", image, "uint*", width, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<UInt32>} height 
     * @returns {Integer} 
     */
    static GdipGetImageHeight(image, height) {
        result := DllCall("gdiplus.dll\GdipGetImageHeight", "ptr", image, "uint*", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<Single>} resolution 
     * @returns {Integer} 
     */
    static GdipGetImageHorizontalResolution(image, resolution) {
        result := DllCall("gdiplus.dll\GdipGetImageHorizontalResolution", "ptr", image, "float*", resolution, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<Single>} resolution 
     * @returns {Integer} 
     */
    static GdipGetImageVerticalResolution(image, resolution) {
        result := DllCall("gdiplus.dll\GdipGetImageVerticalResolution", "ptr", image, "float*", resolution, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<UInt32>} flags 
     * @returns {Integer} 
     */
    static GdipGetImageFlags(image, flags) {
        result := DllCall("gdiplus.dll\GdipGetImageFlags", "ptr", image, "uint*", flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<Guid>} format 
     * @returns {Integer} 
     */
    static GdipGetImageRawFormat(image, format) {
        result := DllCall("gdiplus.dll\GdipGetImageRawFormat", "ptr", image, "ptr", format, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<Int32>} format 
     * @returns {Integer} 
     */
    static GdipGetImagePixelFormat(image, format) {
        result := DllCall("gdiplus.dll\GdipGetImagePixelFormat", "ptr", image, "int*", format, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Integer} thumbWidth 
     * @param {Integer} thumbHeight 
     * @param {Pointer<GpImage>} thumbImage 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @returns {Integer} 
     */
    static GdipGetImageThumbnail(image, thumbWidth, thumbHeight, thumbImage, callback, callbackData) {
        result := DllCall("gdiplus.dll\GdipGetImageThumbnail", "ptr", image, "uint", thumbWidth, "uint", thumbHeight, "ptr", thumbImage, "ptr", callback, "ptr", callbackData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<Guid>} clsidEncoder 
     * @param {Pointer<UInt32>} size 
     * @returns {Integer} 
     */
    static GdipGetEncoderParameterListSize(image, clsidEncoder, size) {
        result := DllCall("gdiplus.dll\GdipGetEncoderParameterListSize", "ptr", image, "ptr", clsidEncoder, "uint*", size, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<Guid>} clsidEncoder 
     * @param {Integer} size 
     * @param {Pointer<EncoderParameters>} buffer 
     * @returns {Integer} 
     */
    static GdipGetEncoderParameterList(image, clsidEncoder, size, buffer) {
        result := DllCall("gdiplus.dll\GdipGetEncoderParameterList", "ptr", image, "ptr", clsidEncoder, "uint", size, "ptr", buffer, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<UInt32>} count 
     * @returns {Integer} 
     */
    static GdipImageGetFrameDimensionsCount(image, count) {
        result := DllCall("gdiplus.dll\GdipImageGetFrameDimensionsCount", "ptr", image, "uint*", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<Guid>} dimensionIDs 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipImageGetFrameDimensionsList(image, dimensionIDs, count) {
        result := DllCall("gdiplus.dll\GdipImageGetFrameDimensionsList", "ptr", image, "ptr", dimensionIDs, "uint", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<Guid>} dimensionID 
     * @param {Pointer<UInt32>} count 
     * @returns {Integer} 
     */
    static GdipImageGetFrameCount(image, dimensionID, count) {
        result := DllCall("gdiplus.dll\GdipImageGetFrameCount", "ptr", image, "ptr", dimensionID, "uint*", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<Guid>} dimensionID 
     * @param {Integer} frameIndex 
     * @returns {Integer} 
     */
    static GdipImageSelectActiveFrame(image, dimensionID, frameIndex) {
        result := DllCall("gdiplus.dll\GdipImageSelectActiveFrame", "ptr", image, "ptr", dimensionID, "uint", frameIndex, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Integer} rfType 
     * @returns {Integer} 
     */
    static GdipImageRotateFlip(image, rfType) {
        result := DllCall("gdiplus.dll\GdipImageRotateFlip", "ptr", image, "int", rfType, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<ColorPalette>} palette 
     * @param {Integer} size 
     * @returns {Integer} 
     */
    static GdipGetImagePalette(image, palette, size) {
        result := DllCall("gdiplus.dll\GdipGetImagePalette", "ptr", image, "ptr", palette, "int", size, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<ColorPalette>} palette 
     * @returns {Integer} 
     */
    static GdipSetImagePalette(image, palette) {
        result := DllCall("gdiplus.dll\GdipSetImagePalette", "ptr", image, "ptr", palette, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<Int32>} size 
     * @returns {Integer} 
     */
    static GdipGetImagePaletteSize(image, size) {
        result := DllCall("gdiplus.dll\GdipGetImagePaletteSize", "ptr", image, "int*", size, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<UInt32>} numOfProperty 
     * @returns {Integer} 
     */
    static GdipGetPropertyCount(image, numOfProperty) {
        result := DllCall("gdiplus.dll\GdipGetPropertyCount", "ptr", image, "uint*", numOfProperty, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Integer} numOfProperty 
     * @param {Pointer<UInt32>} list 
     * @returns {Integer} 
     */
    static GdipGetPropertyIdList(image, numOfProperty, list) {
        result := DllCall("gdiplus.dll\GdipGetPropertyIdList", "ptr", image, "uint", numOfProperty, "uint*", list, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Integer} propId 
     * @param {Pointer<UInt32>} size 
     * @returns {Integer} 
     */
    static GdipGetPropertyItemSize(image, propId, size) {
        result := DllCall("gdiplus.dll\GdipGetPropertyItemSize", "ptr", image, "uint", propId, "uint*", size, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Integer} propId 
     * @param {Integer} propSize 
     * @param {Pointer<PropertyItem>} buffer 
     * @returns {Integer} 
     */
    static GdipGetPropertyItem(image, propId, propSize, buffer) {
        result := DllCall("gdiplus.dll\GdipGetPropertyItem", "ptr", image, "uint", propId, "uint", propSize, "ptr", buffer, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<UInt32>} totalBufferSize 
     * @param {Pointer<UInt32>} numProperties 
     * @returns {Integer} 
     */
    static GdipGetPropertySize(image, totalBufferSize, numProperties) {
        result := DllCall("gdiplus.dll\GdipGetPropertySize", "ptr", image, "uint*", totalBufferSize, "uint*", numProperties, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Integer} totalBufferSize 
     * @param {Integer} numProperties 
     * @param {Pointer<PropertyItem>} allItems 
     * @returns {Integer} 
     */
    static GdipGetAllPropertyItems(image, totalBufferSize, numProperties, allItems) {
        result := DllCall("gdiplus.dll\GdipGetAllPropertyItems", "ptr", image, "uint", totalBufferSize, "uint", numProperties, "ptr", allItems, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Integer} propId 
     * @returns {Integer} 
     */
    static GdipRemovePropertyItem(image, propId) {
        result := DllCall("gdiplus.dll\GdipRemovePropertyItem", "ptr", image, "uint", propId, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<PropertyItem>} item 
     * @returns {Integer} 
     */
    static GdipSetPropertyItem(image, item) {
        result := DllCall("gdiplus.dll\GdipSetPropertyItem", "ptr", image, "ptr", item, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<ImageItemData>} item 
     * @returns {Integer} 
     */
    static GdipFindFirstImageItem(image, item) {
        result := DllCall("gdiplus.dll\GdipFindFirstImageItem", "ptr", image, "ptr", item, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<ImageItemData>} item 
     * @returns {Integer} 
     */
    static GdipFindNextImageItem(image, item) {
        result := DllCall("gdiplus.dll\GdipFindNextImageItem", "ptr", image, "ptr", item, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<ImageItemData>} item 
     * @returns {Integer} 
     */
    static GdipGetImageItemData(image, item) {
        result := DllCall("gdiplus.dll\GdipGetImageItemData", "ptr", image, "ptr", item, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image 
     * @returns {Integer} 
     */
    static GdipImageForceValidation(image) {
        result := DllCall("gdiplus.dll\GdipImageForceValidation", "ptr", image, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} stream 
     * @param {Pointer<GpBitmap>} bitmap 
     * @returns {Integer} 
     */
    static GdipCreateBitmapFromStream(stream, bitmap) {
        result := DllCall("gdiplus.dll\GdipCreateBitmapFromStream", "ptr", stream, "ptr", bitmap, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} filename 
     * @param {Pointer<GpBitmap>} bitmap 
     * @returns {Integer} 
     */
    static GdipCreateBitmapFromFile(filename, bitmap) {
        filename := filename is String ? StrPtr(filename) : filename

        result := DllCall("gdiplus.dll\GdipCreateBitmapFromFile", "ptr", filename, "ptr", bitmap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} stream 
     * @param {Pointer<GpBitmap>} bitmap 
     * @returns {Integer} 
     */
    static GdipCreateBitmapFromStreamICM(stream, bitmap) {
        result := DllCall("gdiplus.dll\GdipCreateBitmapFromStreamICM", "ptr", stream, "ptr", bitmap, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} filename 
     * @param {Pointer<GpBitmap>} bitmap 
     * @returns {Integer} 
     */
    static GdipCreateBitmapFromFileICM(filename, bitmap) {
        filename := filename is String ? StrPtr(filename) : filename

        result := DllCall("gdiplus.dll\GdipCreateBitmapFromFileICM", "ptr", filename, "ptr", bitmap, "int")
        return result
    }

    /**
     * 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} stride 
     * @param {Integer} format 
     * @param {Pointer<Byte>} scan0 
     * @param {Pointer<GpBitmap>} bitmap 
     * @returns {Integer} 
     */
    static GdipCreateBitmapFromScan0(width, height, stride, format, scan0, bitmap) {
        result := DllCall("gdiplus.dll\GdipCreateBitmapFromScan0", "int", width, "int", height, "int", stride, "int", format, "char*", scan0, "ptr", bitmap, "int")
        return result
    }

    /**
     * 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Pointer<GpGraphics>} target 
     * @param {Pointer<GpBitmap>} bitmap 
     * @returns {Integer} 
     */
    static GdipCreateBitmapFromGraphics(width, height, target, bitmap) {
        result := DllCall("gdiplus.dll\GdipCreateBitmapFromGraphics", "int", width, "int", height, "ptr", target, "ptr", bitmap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IDirectDrawSurface7>} surface 
     * @param {Pointer<GpBitmap>} bitmap 
     * @returns {Integer} 
     */
    static GdipCreateBitmapFromDirectDrawSurface(surface, bitmap) {
        result := DllCall("gdiplus.dll\GdipCreateBitmapFromDirectDrawSurface", "ptr", surface, "ptr", bitmap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<BITMAPINFO>} gdiBitmapInfo 
     * @param {Pointer<Void>} gdiBitmapData 
     * @param {Pointer<GpBitmap>} bitmap 
     * @returns {Integer} 
     */
    static GdipCreateBitmapFromGdiDib(gdiBitmapInfo, gdiBitmapData, bitmap) {
        result := DllCall("gdiplus.dll\GdipCreateBitmapFromGdiDib", "ptr", gdiBitmapInfo, "ptr", gdiBitmapData, "ptr", bitmap, "int")
        return result
    }

    /**
     * 
     * @param {HBITMAP} hbm 
     * @param {HPALETTE} hpal 
     * @param {Pointer<GpBitmap>} bitmap 
     * @returns {Integer} 
     */
    static GdipCreateBitmapFromHBITMAP(hbm, hpal, bitmap) {
        hbm := hbm is Win32Handle ? NumGet(hbm, "ptr") : hbm
        hpal := hpal is Win32Handle ? NumGet(hpal, "ptr") : hpal

        result := DllCall("gdiplus.dll\GdipCreateBitmapFromHBITMAP", "ptr", hbm, "ptr", hpal, "ptr", bitmap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBitmap>} bitmap 
     * @param {Pointer<HBITMAP>} hbmReturn 
     * @param {Integer} background 
     * @returns {Integer} 
     */
    static GdipCreateHBITMAPFromBitmap(bitmap, hbmReturn, background) {
        result := DllCall("gdiplus.dll\GdipCreateHBITMAPFromBitmap", "ptr", bitmap, "ptr", hbmReturn, "uint", background, "int")
        return result
    }

    /**
     * 
     * @param {HICON} hicon 
     * @param {Pointer<GpBitmap>} bitmap 
     * @returns {Integer} 
     */
    static GdipCreateBitmapFromHICON(hicon, bitmap) {
        hicon := hicon is Win32Handle ? NumGet(hicon, "ptr") : hicon

        result := DllCall("gdiplus.dll\GdipCreateBitmapFromHICON", "ptr", hicon, "ptr", bitmap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBitmap>} bitmap 
     * @param {Pointer<HICON>} hbmReturn 
     * @returns {Integer} 
     */
    static GdipCreateHICONFromBitmap(bitmap, hbmReturn) {
        result := DllCall("gdiplus.dll\GdipCreateHICONFromBitmap", "ptr", bitmap, "ptr", hbmReturn, "int")
        return result
    }

    /**
     * 
     * @param {HINSTANCE} hInstance 
     * @param {PWSTR} lpBitmapName 
     * @param {Pointer<GpBitmap>} bitmap 
     * @returns {Integer} 
     */
    static GdipCreateBitmapFromResource(hInstance, lpBitmapName, bitmap) {
        lpBitmapName := lpBitmapName is String ? StrPtr(lpBitmapName) : lpBitmapName
        hInstance := hInstance is Win32Handle ? NumGet(hInstance, "ptr") : hInstance

        result := DllCall("gdiplus.dll\GdipCreateBitmapFromResource", "ptr", hInstance, "ptr", lpBitmapName, "ptr", bitmap, "int")
        return result
    }

    /**
     * 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @param {Integer} format 
     * @param {Pointer<GpBitmap>} srcBitmap 
     * @param {Pointer<GpBitmap>} dstBitmap 
     * @returns {Integer} 
     */
    static GdipCloneBitmapArea(x, y, width, height, format, srcBitmap, dstBitmap) {
        result := DllCall("gdiplus.dll\GdipCloneBitmapArea", "float", x, "float", y, "float", width, "float", height, "int", format, "ptr", srcBitmap, "ptr", dstBitmap, "int")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} format 
     * @param {Pointer<GpBitmap>} srcBitmap 
     * @param {Pointer<GpBitmap>} dstBitmap 
     * @returns {Integer} 
     */
    static GdipCloneBitmapAreaI(x, y, width, height, format, srcBitmap, dstBitmap) {
        result := DllCall("gdiplus.dll\GdipCloneBitmapAreaI", "int", x, "int", y, "int", width, "int", height, "int", format, "ptr", srcBitmap, "ptr", dstBitmap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBitmap>} bitmap 
     * @param {Pointer<Rect>} rect 
     * @param {Integer} flags 
     * @param {Integer} format 
     * @param {Pointer<BitmapData>} lockedBitmapData 
     * @returns {Integer} 
     */
    static GdipBitmapLockBits(bitmap, rect, flags, format, lockedBitmapData) {
        result := DllCall("gdiplus.dll\GdipBitmapLockBits", "ptr", bitmap, "ptr", rect, "uint", flags, "int", format, "ptr", lockedBitmapData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBitmap>} bitmap 
     * @param {Pointer<BitmapData>} lockedBitmapData 
     * @returns {Integer} 
     */
    static GdipBitmapUnlockBits(bitmap, lockedBitmapData) {
        result := DllCall("gdiplus.dll\GdipBitmapUnlockBits", "ptr", bitmap, "ptr", lockedBitmapData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBitmap>} bitmap 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Pointer<UInt32>} color 
     * @returns {Integer} 
     */
    static GdipBitmapGetPixel(bitmap, x, y, color) {
        result := DllCall("gdiplus.dll\GdipBitmapGetPixel", "ptr", bitmap, "int", x, "int", y, "uint*", color, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBitmap>} bitmap 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} color 
     * @returns {Integer} 
     */
    static GdipBitmapSetPixel(bitmap, x, y, color) {
        result := DllCall("gdiplus.dll\GdipBitmapSetPixel", "ptr", bitmap, "int", x, "int", y, "uint", color, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} pImage 
     * @param {Pointer<GdiplusAbort>} pIAbort 
     * @returns {Integer} 
     */
    static GdipImageSetAbort(pImage, pIAbort) {
        result := DllCall("gdiplus.dll\GdipImageSetAbort", "ptr", pImage, "ptr", pIAbort, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} pGraphics 
     * @param {Pointer<GdiplusAbort>} pIAbort 
     * @returns {Integer} 
     */
    static GdipGraphicsSetAbort(pGraphics, pIAbort) {
        result := DllCall("gdiplus.dll\GdipGraphicsSetAbort", "ptr", pGraphics, "ptr", pIAbort, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBitmap>} pInputBitmap 
     * @param {Integer} format 
     * @param {Integer} dithertype 
     * @param {Integer} palettetype 
     * @param {Pointer<ColorPalette>} palette 
     * @param {Float} alphaThresholdPercent 
     * @returns {Integer} 
     */
    static GdipBitmapConvertFormat(pInputBitmap, format, dithertype, palettetype, palette, alphaThresholdPercent) {
        result := DllCall("gdiplus.dll\GdipBitmapConvertFormat", "ptr", pInputBitmap, "int", format, "int", dithertype, "int", palettetype, "ptr", palette, "float", alphaThresholdPercent, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ColorPalette>} palette 
     * @param {Integer} palettetype 
     * @param {Integer} optimalColors 
     * @param {BOOL} useTransparentColor 
     * @param {Pointer<GpBitmap>} bitmap 
     * @returns {Integer} 
     */
    static GdipInitializePalette(palette, palettetype, optimalColors, useTransparentColor, bitmap) {
        result := DllCall("gdiplus.dll\GdipInitializePalette", "ptr", palette, "int", palettetype, "int", optimalColors, "int", useTransparentColor, "ptr", bitmap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBitmap>} bitmap 
     * @param {Pointer<CGpEffect>} effect 
     * @param {Pointer<RECT>} roi 
     * @param {BOOL} useAuxData 
     * @param {Pointer<Void>} auxData 
     * @param {Pointer<Int32>} auxDataSize 
     * @returns {Integer} 
     */
    static GdipBitmapApplyEffect(bitmap, effect, roi, useAuxData, auxData, auxDataSize) {
        result := DllCall("gdiplus.dll\GdipBitmapApplyEffect", "ptr", bitmap, "ptr", effect, "ptr", roi, "int", useAuxData, "ptr", auxData, "int*", auxDataSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBitmap>} inputBitmaps 
     * @param {Integer} numInputs 
     * @param {Pointer<CGpEffect>} effect 
     * @param {Pointer<RECT>} roi 
     * @param {Pointer<RECT>} outputRect 
     * @param {Pointer<GpBitmap>} outputBitmap 
     * @param {BOOL} useAuxData 
     * @param {Pointer<Void>} auxData 
     * @param {Pointer<Int32>} auxDataSize 
     * @returns {Integer} 
     */
    static GdipBitmapCreateApplyEffect(inputBitmaps, numInputs, effect, roi, outputRect, outputBitmap, useAuxData, auxData, auxDataSize) {
        result := DllCall("gdiplus.dll\GdipBitmapCreateApplyEffect", "ptr", inputBitmaps, "int", numInputs, "ptr", effect, "ptr", roi, "ptr", outputRect, "ptr", outputBitmap, "int", useAuxData, "ptr", auxData, "int*", auxDataSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBitmap>} bitmap 
     * @param {Integer} format 
     * @param {Integer} NumberOfEntries 
     * @param {Pointer<UInt32>} channel0 
     * @param {Pointer<UInt32>} channel1 
     * @param {Pointer<UInt32>} channel2 
     * @param {Pointer<UInt32>} channel3 
     * @returns {Integer} 
     */
    static GdipBitmapGetHistogram(bitmap, format, NumberOfEntries, channel0, channel1, channel2, channel3) {
        result := DllCall("gdiplus.dll\GdipBitmapGetHistogram", "ptr", bitmap, "int", format, "uint", NumberOfEntries, "uint*", channel0, "uint*", channel1, "uint*", channel2, "uint*", channel3, "int")
        return result
    }

    /**
     * 
     * @param {Integer} format 
     * @param {Pointer<UInt32>} NumberOfEntries 
     * @returns {Integer} 
     */
    static GdipBitmapGetHistogramSize(format, NumberOfEntries) {
        result := DllCall("gdiplus.dll\GdipBitmapGetHistogramSize", "int", format, "uint*", NumberOfEntries, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBitmap>} bitmap 
     * @param {Float} xdpi 
     * @param {Float} ydpi 
     * @returns {Integer} 
     */
    static GdipBitmapSetResolution(bitmap, xdpi, ydpi) {
        result := DllCall("gdiplus.dll\GdipBitmapSetResolution", "ptr", bitmap, "float", xdpi, "float", ydpi, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImageAttributes>} imageattr 
     * @returns {Integer} 
     */
    static GdipCreateImageAttributes(imageattr) {
        result := DllCall("gdiplus.dll\GdipCreateImageAttributes", "ptr", imageattr, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImageAttributes>} imageattr 
     * @param {Pointer<GpImageAttributes>} cloneImageattr 
     * @returns {Integer} 
     */
    static GdipCloneImageAttributes(imageattr, cloneImageattr) {
        result := DllCall("gdiplus.dll\GdipCloneImageAttributes", "ptr", imageattr, "ptr", cloneImageattr, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImageAttributes>} imageattr 
     * @returns {Integer} 
     */
    static GdipDisposeImageAttributes(imageattr) {
        result := DllCall("gdiplus.dll\GdipDisposeImageAttributes", "ptr", imageattr, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImageAttributes>} imageattr 
     * @param {Integer} type 
     * @returns {Integer} 
     */
    static GdipSetImageAttributesToIdentity(imageattr, type) {
        result := DllCall("gdiplus.dll\GdipSetImageAttributesToIdentity", "ptr", imageattr, "int", type, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImageAttributes>} imageattr 
     * @param {Integer} type 
     * @returns {Integer} 
     */
    static GdipResetImageAttributes(imageattr, type) {
        result := DllCall("gdiplus.dll\GdipResetImageAttributes", "ptr", imageattr, "int", type, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImageAttributes>} imageattr 
     * @param {Integer} type 
     * @param {BOOL} enableFlag 
     * @param {Pointer<ColorMatrix>} colorMatrix 
     * @param {Pointer<ColorMatrix>} grayMatrix 
     * @param {Integer} flags 
     * @returns {Integer} 
     */
    static GdipSetImageAttributesColorMatrix(imageattr, type, enableFlag, colorMatrix, grayMatrix, flags) {
        result := DllCall("gdiplus.dll\GdipSetImageAttributesColorMatrix", "ptr", imageattr, "int", type, "int", enableFlag, "ptr", colorMatrix, "ptr", grayMatrix, "int", flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImageAttributes>} imageattr 
     * @param {Integer} type 
     * @param {BOOL} enableFlag 
     * @param {Float} threshold 
     * @returns {Integer} 
     */
    static GdipSetImageAttributesThreshold(imageattr, type, enableFlag, threshold) {
        result := DllCall("gdiplus.dll\GdipSetImageAttributesThreshold", "ptr", imageattr, "int", type, "int", enableFlag, "float", threshold, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImageAttributes>} imageattr 
     * @param {Integer} type 
     * @param {BOOL} enableFlag 
     * @param {Float} gamma 
     * @returns {Integer} 
     */
    static GdipSetImageAttributesGamma(imageattr, type, enableFlag, gamma) {
        result := DllCall("gdiplus.dll\GdipSetImageAttributesGamma", "ptr", imageattr, "int", type, "int", enableFlag, "float", gamma, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImageAttributes>} imageattr 
     * @param {Integer} type 
     * @param {BOOL} enableFlag 
     * @returns {Integer} 
     */
    static GdipSetImageAttributesNoOp(imageattr, type, enableFlag) {
        result := DllCall("gdiplus.dll\GdipSetImageAttributesNoOp", "ptr", imageattr, "int", type, "int", enableFlag, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImageAttributes>} imageattr 
     * @param {Integer} type 
     * @param {BOOL} enableFlag 
     * @param {Integer} colorLow 
     * @param {Integer} colorHigh 
     * @returns {Integer} 
     */
    static GdipSetImageAttributesColorKeys(imageattr, type, enableFlag, colorLow, colorHigh) {
        result := DllCall("gdiplus.dll\GdipSetImageAttributesColorKeys", "ptr", imageattr, "int", type, "int", enableFlag, "uint", colorLow, "uint", colorHigh, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImageAttributes>} imageattr 
     * @param {Integer} type 
     * @param {BOOL} enableFlag 
     * @param {Integer} channelFlags 
     * @returns {Integer} 
     */
    static GdipSetImageAttributesOutputChannel(imageattr, type, enableFlag, channelFlags) {
        result := DllCall("gdiplus.dll\GdipSetImageAttributesOutputChannel", "ptr", imageattr, "int", type, "int", enableFlag, "int", channelFlags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImageAttributes>} imageattr 
     * @param {Integer} type 
     * @param {BOOL} enableFlag 
     * @param {PWSTR} colorProfileFilename 
     * @returns {Integer} 
     */
    static GdipSetImageAttributesOutputChannelColorProfile(imageattr, type, enableFlag, colorProfileFilename) {
        colorProfileFilename := colorProfileFilename is String ? StrPtr(colorProfileFilename) : colorProfileFilename

        result := DllCall("gdiplus.dll\GdipSetImageAttributesOutputChannelColorProfile", "ptr", imageattr, "int", type, "int", enableFlag, "ptr", colorProfileFilename, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImageAttributes>} imageattr 
     * @param {Integer} type 
     * @param {BOOL} enableFlag 
     * @param {Integer} mapSize 
     * @param {Pointer<ColorMap>} map 
     * @returns {Integer} 
     */
    static GdipSetImageAttributesRemapTable(imageattr, type, enableFlag, mapSize, map) {
        result := DllCall("gdiplus.dll\GdipSetImageAttributesRemapTable", "ptr", imageattr, "int", type, "int", enableFlag, "uint", mapSize, "ptr", map, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImageAttributes>} imageAttr 
     * @param {Integer} wrap 
     * @param {Integer} argb 
     * @param {BOOL} clamp 
     * @returns {Integer} 
     */
    static GdipSetImageAttributesWrapMode(imageAttr, wrap, argb, clamp) {
        result := DllCall("gdiplus.dll\GdipSetImageAttributesWrapMode", "ptr", imageAttr, "int", wrap, "uint", argb, "int", clamp, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImageAttributes>} imageAttr 
     * @param {Pointer<ColorPalette>} colorPalette 
     * @param {Integer} colorAdjustType 
     * @returns {Integer} 
     */
    static GdipGetImageAttributesAdjustedPalette(imageAttr, colorPalette, colorAdjustType) {
        result := DllCall("gdiplus.dll\GdipGetImageAttributesAdjustedPalette", "ptr", imageAttr, "ptr", colorPalette, "int", colorAdjustType, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} intention 
     * @returns {Integer} 
     */
    static GdipFlush(graphics, intention) {
        result := DllCall("gdiplus.dll\GdipFlush", "ptr", graphics, "int", intention, "int")
        return result
    }

    /**
     * 
     * @param {HDC} hdc 
     * @param {Pointer<GpGraphics>} graphics 
     * @returns {Integer} 
     */
    static GdipCreateFromHDC(hdc, graphics) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("gdiplus.dll\GdipCreateFromHDC", "ptr", hdc, "ptr", graphics, "int")
        return result
    }

    /**
     * 
     * @param {HDC} hdc 
     * @param {HANDLE} hDevice 
     * @param {Pointer<GpGraphics>} graphics 
     * @returns {Integer} 
     */
    static GdipCreateFromHDC2(hdc, hDevice, graphics) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        result := DllCall("gdiplus.dll\GdipCreateFromHDC2", "ptr", hdc, "ptr", hDevice, "ptr", graphics, "int")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<GpGraphics>} graphics 
     * @returns {Integer} 
     */
    static GdipCreateFromHWND(hwnd, graphics) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("gdiplus.dll\GdipCreateFromHWND", "ptr", hwnd, "ptr", graphics, "int")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<GpGraphics>} graphics 
     * @returns {Integer} 
     */
    static GdipCreateFromHWNDICM(hwnd, graphics) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("gdiplus.dll\GdipCreateFromHWNDICM", "ptr", hwnd, "ptr", graphics, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @returns {Integer} 
     */
    static GdipDeleteGraphics(graphics) {
        result := DllCall("gdiplus.dll\GdipDeleteGraphics", "ptr", graphics, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<HDC>} hdc 
     * @returns {Integer} 
     */
    static GdipGetDC(graphics, hdc) {
        result := DllCall("gdiplus.dll\GdipGetDC", "ptr", graphics, "ptr", hdc, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {HDC} hdc 
     * @returns {Integer} 
     */
    static GdipReleaseDC(graphics, hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("gdiplus.dll\GdipReleaseDC", "ptr", graphics, "ptr", hdc, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} compositingMode 
     * @returns {Integer} 
     */
    static GdipSetCompositingMode(graphics, compositingMode) {
        result := DllCall("gdiplus.dll\GdipSetCompositingMode", "ptr", graphics, "int", compositingMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Int32>} compositingMode 
     * @returns {Integer} 
     */
    static GdipGetCompositingMode(graphics, compositingMode) {
        result := DllCall("gdiplus.dll\GdipGetCompositingMode", "ptr", graphics, "int*", compositingMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {Integer} 
     */
    static GdipSetRenderingOrigin(graphics, x, y) {
        result := DllCall("gdiplus.dll\GdipSetRenderingOrigin", "ptr", graphics, "int", x, "int", y, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Int32>} x 
     * @param {Pointer<Int32>} y 
     * @returns {Integer} 
     */
    static GdipGetRenderingOrigin(graphics, x, y) {
        result := DllCall("gdiplus.dll\GdipGetRenderingOrigin", "ptr", graphics, "int*", x, "int*", y, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} compositingQuality 
     * @returns {Integer} 
     */
    static GdipSetCompositingQuality(graphics, compositingQuality) {
        result := DllCall("gdiplus.dll\GdipSetCompositingQuality", "ptr", graphics, "int", compositingQuality, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Int32>} compositingQuality 
     * @returns {Integer} 
     */
    static GdipGetCompositingQuality(graphics, compositingQuality) {
        result := DllCall("gdiplus.dll\GdipGetCompositingQuality", "ptr", graphics, "int*", compositingQuality, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} smoothingMode 
     * @returns {Integer} 
     */
    static GdipSetSmoothingMode(graphics, smoothingMode) {
        result := DllCall("gdiplus.dll\GdipSetSmoothingMode", "ptr", graphics, "int", smoothingMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Int32>} smoothingMode 
     * @returns {Integer} 
     */
    static GdipGetSmoothingMode(graphics, smoothingMode) {
        result := DllCall("gdiplus.dll\GdipGetSmoothingMode", "ptr", graphics, "int*", smoothingMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} pixelOffsetMode 
     * @returns {Integer} 
     */
    static GdipSetPixelOffsetMode(graphics, pixelOffsetMode) {
        result := DllCall("gdiplus.dll\GdipSetPixelOffsetMode", "ptr", graphics, "int", pixelOffsetMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Int32>} pixelOffsetMode 
     * @returns {Integer} 
     */
    static GdipGetPixelOffsetMode(graphics, pixelOffsetMode) {
        result := DllCall("gdiplus.dll\GdipGetPixelOffsetMode", "ptr", graphics, "int*", pixelOffsetMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} mode 
     * @returns {Integer} 
     */
    static GdipSetTextRenderingHint(graphics, mode) {
        result := DllCall("gdiplus.dll\GdipSetTextRenderingHint", "ptr", graphics, "int", mode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Int32>} mode 
     * @returns {Integer} 
     */
    static GdipGetTextRenderingHint(graphics, mode) {
        result := DllCall("gdiplus.dll\GdipGetTextRenderingHint", "ptr", graphics, "int*", mode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} contrast 
     * @returns {Integer} 
     */
    static GdipSetTextContrast(graphics, contrast) {
        result := DllCall("gdiplus.dll\GdipSetTextContrast", "ptr", graphics, "uint", contrast, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<UInt32>} contrast 
     * @returns {Integer} 
     */
    static GdipGetTextContrast(graphics, contrast) {
        result := DllCall("gdiplus.dll\GdipGetTextContrast", "ptr", graphics, "uint*", contrast, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} interpolationMode 
     * @returns {Integer} 
     */
    static GdipSetInterpolationMode(graphics, interpolationMode) {
        result := DllCall("gdiplus.dll\GdipSetInterpolationMode", "ptr", graphics, "int", interpolationMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Int32>} interpolationMode 
     * @returns {Integer} 
     */
    static GdipGetInterpolationMode(graphics, interpolationMode) {
        result := DllCall("gdiplus.dll\GdipGetInterpolationMode", "ptr", graphics, "int*", interpolationMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Matrix>} matrix 
     * @returns {Integer} 
     */
    static GdipSetWorldTransform(graphics, matrix) {
        result := DllCall("gdiplus.dll\GdipSetWorldTransform", "ptr", graphics, "ptr", matrix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @returns {Integer} 
     */
    static GdipResetWorldTransform(graphics) {
        result := DllCall("gdiplus.dll\GdipResetWorldTransform", "ptr", graphics, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Matrix>} matrix 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipMultiplyWorldTransform(graphics, matrix, order) {
        result := DllCall("gdiplus.dll\GdipMultiplyWorldTransform", "ptr", graphics, "ptr", matrix, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Float} dx 
     * @param {Float} dy 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipTranslateWorldTransform(graphics, dx, dy, order) {
        result := DllCall("gdiplus.dll\GdipTranslateWorldTransform", "ptr", graphics, "float", dx, "float", dy, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Float} sx 
     * @param {Float} sy 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipScaleWorldTransform(graphics, sx, sy, order) {
        result := DllCall("gdiplus.dll\GdipScaleWorldTransform", "ptr", graphics, "float", sx, "float", sy, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Float} angle 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipRotateWorldTransform(graphics, angle, order) {
        result := DllCall("gdiplus.dll\GdipRotateWorldTransform", "ptr", graphics, "float", angle, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Matrix>} matrix 
     * @returns {Integer} 
     */
    static GdipGetWorldTransform(graphics, matrix) {
        result := DllCall("gdiplus.dll\GdipGetWorldTransform", "ptr", graphics, "ptr", matrix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @returns {Integer} 
     */
    static GdipResetPageTransform(graphics) {
        result := DllCall("gdiplus.dll\GdipResetPageTransform", "ptr", graphics, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Int32>} unit 
     * @returns {Integer} 
     */
    static GdipGetPageUnit(graphics, unit) {
        result := DllCall("gdiplus.dll\GdipGetPageUnit", "ptr", graphics, "int*", unit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Single>} scale 
     * @returns {Integer} 
     */
    static GdipGetPageScale(graphics, scale) {
        result := DllCall("gdiplus.dll\GdipGetPageScale", "ptr", graphics, "float*", scale, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} unit 
     * @returns {Integer} 
     */
    static GdipSetPageUnit(graphics, unit) {
        result := DllCall("gdiplus.dll\GdipSetPageUnit", "ptr", graphics, "int", unit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Float} scale 
     * @returns {Integer} 
     */
    static GdipSetPageScale(graphics, scale) {
        result := DllCall("gdiplus.dll\GdipSetPageScale", "ptr", graphics, "float", scale, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Single>} dpi 
     * @returns {Integer} 
     */
    static GdipGetDpiX(graphics, dpi) {
        result := DllCall("gdiplus.dll\GdipGetDpiX", "ptr", graphics, "float*", dpi, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Single>} dpi 
     * @returns {Integer} 
     */
    static GdipGetDpiY(graphics, dpi) {
        result := DllCall("gdiplus.dll\GdipGetDpiY", "ptr", graphics, "float*", dpi, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} destSpace 
     * @param {Integer} srcSpace 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipTransformPoints(graphics, destSpace, srcSpace, points, count) {
        result := DllCall("gdiplus.dll\GdipTransformPoints", "ptr", graphics, "int", destSpace, "int", srcSpace, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} destSpace 
     * @param {Integer} srcSpace 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipTransformPointsI(graphics, destSpace, srcSpace, points, count) {
        result := DllCall("gdiplus.dll\GdipTransformPointsI", "ptr", graphics, "int", destSpace, "int", srcSpace, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<UInt32>} argb 
     * @returns {Integer} 
     */
    static GdipGetNearestColor(graphics, argb) {
        result := DllCall("gdiplus.dll\GdipGetNearestColor", "ptr", graphics, "uint*", argb, "int")
        return result
    }

    /**
     * 
     * @returns {HPALETTE} 
     */
    static GdipCreateHalftonePalette() {
        result := DllCall("gdiplus.dll\GdipCreateHalftonePalette", "ptr")
        return HPALETTE({Value: result}, True)
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Float} x1 
     * @param {Float} y1 
     * @param {Float} x2 
     * @param {Float} y2 
     * @returns {Integer} 
     */
    static GdipDrawLine(graphics, pen, x1, y1, x2, y2) {
        result := DllCall("gdiplus.dll\GdipDrawLine", "ptr", graphics, "ptr", pen, "float", x1, "float", y1, "float", x2, "float", y2, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Integer} x1 
     * @param {Integer} y1 
     * @param {Integer} x2 
     * @param {Integer} y2 
     * @returns {Integer} 
     */
    static GdipDrawLineI(graphics, pen, x1, y1, x2, y2) {
        result := DllCall("gdiplus.dll\GdipDrawLineI", "ptr", graphics, "ptr", pen, "int", x1, "int", y1, "int", x2, "int", y2, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawLines(graphics, pen, points, count) {
        result := DllCall("gdiplus.dll\GdipDrawLines", "ptr", graphics, "ptr", pen, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawLinesI(graphics, pen, points, count) {
        result := DllCall("gdiplus.dll\GdipDrawLinesI", "ptr", graphics, "ptr", pen, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @param {Float} startAngle 
     * @param {Float} sweepAngle 
     * @returns {Integer} 
     */
    static GdipDrawArc(graphics, pen, x, y, width, height, startAngle, sweepAngle) {
        result := DllCall("gdiplus.dll\GdipDrawArc", "ptr", graphics, "ptr", pen, "float", x, "float", y, "float", width, "float", height, "float", startAngle, "float", sweepAngle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Float} startAngle 
     * @param {Float} sweepAngle 
     * @returns {Integer} 
     */
    static GdipDrawArcI(graphics, pen, x, y, width, height, startAngle, sweepAngle) {
        result := DllCall("gdiplus.dll\GdipDrawArcI", "ptr", graphics, "ptr", pen, "int", x, "int", y, "int", width, "int", height, "float", startAngle, "float", sweepAngle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Float} x1 
     * @param {Float} y1 
     * @param {Float} x2 
     * @param {Float} y2 
     * @param {Float} x3 
     * @param {Float} y3 
     * @param {Float} x4 
     * @param {Float} y4 
     * @returns {Integer} 
     */
    static GdipDrawBezier(graphics, pen, x1, y1, x2, y2, x3, y3, x4, y4) {
        result := DllCall("gdiplus.dll\GdipDrawBezier", "ptr", graphics, "ptr", pen, "float", x1, "float", y1, "float", x2, "float", y2, "float", x3, "float", y3, "float", x4, "float", y4, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Integer} x1 
     * @param {Integer} y1 
     * @param {Integer} x2 
     * @param {Integer} y2 
     * @param {Integer} x3 
     * @param {Integer} y3 
     * @param {Integer} x4 
     * @param {Integer} y4 
     * @returns {Integer} 
     */
    static GdipDrawBezierI(graphics, pen, x1, y1, x2, y2, x3, y3, x4, y4) {
        result := DllCall("gdiplus.dll\GdipDrawBezierI", "ptr", graphics, "ptr", pen, "int", x1, "int", y1, "int", x2, "int", y2, "int", x3, "int", y3, "int", x4, "int", y4, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawBeziers(graphics, pen, points, count) {
        result := DllCall("gdiplus.dll\GdipDrawBeziers", "ptr", graphics, "ptr", pen, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawBeziersI(graphics, pen, points, count) {
        result := DllCall("gdiplus.dll\GdipDrawBeziersI", "ptr", graphics, "ptr", pen, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @returns {Integer} 
     */
    static GdipDrawRectangle(graphics, pen, x, y, width, height) {
        result := DllCall("gdiplus.dll\GdipDrawRectangle", "ptr", graphics, "ptr", pen, "float", x, "float", y, "float", width, "float", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {Integer} 
     */
    static GdipDrawRectangleI(graphics, pen, x, y, width, height) {
        result := DllCall("gdiplus.dll\GdipDrawRectangleI", "ptr", graphics, "ptr", pen, "int", x, "int", y, "int", width, "int", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<RectF>} rects 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawRectangles(graphics, pen, rects, count) {
        result := DllCall("gdiplus.dll\GdipDrawRectangles", "ptr", graphics, "ptr", pen, "ptr", rects, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Rect>} rects 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawRectanglesI(graphics, pen, rects, count) {
        result := DllCall("gdiplus.dll\GdipDrawRectanglesI", "ptr", graphics, "ptr", pen, "ptr", rects, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @returns {Integer} 
     */
    static GdipDrawEllipse(graphics, pen, x, y, width, height) {
        result := DllCall("gdiplus.dll\GdipDrawEllipse", "ptr", graphics, "ptr", pen, "float", x, "float", y, "float", width, "float", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {Integer} 
     */
    static GdipDrawEllipseI(graphics, pen, x, y, width, height) {
        result := DllCall("gdiplus.dll\GdipDrawEllipseI", "ptr", graphics, "ptr", pen, "int", x, "int", y, "int", width, "int", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @param {Float} startAngle 
     * @param {Float} sweepAngle 
     * @returns {Integer} 
     */
    static GdipDrawPie(graphics, pen, x, y, width, height, startAngle, sweepAngle) {
        result := DllCall("gdiplus.dll\GdipDrawPie", "ptr", graphics, "ptr", pen, "float", x, "float", y, "float", width, "float", height, "float", startAngle, "float", sweepAngle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Float} startAngle 
     * @param {Float} sweepAngle 
     * @returns {Integer} 
     */
    static GdipDrawPieI(graphics, pen, x, y, width, height, startAngle, sweepAngle) {
        result := DllCall("gdiplus.dll\GdipDrawPieI", "ptr", graphics, "ptr", pen, "int", x, "int", y, "int", width, "int", height, "float", startAngle, "float", sweepAngle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawPolygon(graphics, pen, points, count) {
        result := DllCall("gdiplus.dll\GdipDrawPolygon", "ptr", graphics, "ptr", pen, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawPolygonI(graphics, pen, points, count) {
        result := DllCall("gdiplus.dll\GdipDrawPolygonI", "ptr", graphics, "ptr", pen, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<GpPath>} path 
     * @returns {Integer} 
     */
    static GdipDrawPath(graphics, pen, path) {
        result := DllCall("gdiplus.dll\GdipDrawPath", "ptr", graphics, "ptr", pen, "ptr", path, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawCurve(graphics, pen, points, count) {
        result := DllCall("gdiplus.dll\GdipDrawCurve", "ptr", graphics, "ptr", pen, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawCurveI(graphics, pen, points, count) {
        result := DllCall("gdiplus.dll\GdipDrawCurveI", "ptr", graphics, "ptr", pen, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipDrawCurve2(graphics, pen, points, count, tension) {
        result := DllCall("gdiplus.dll\GdipDrawCurve2", "ptr", graphics, "ptr", pen, "ptr", points, "int", count, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipDrawCurve2I(graphics, pen, points, count, tension) {
        result := DllCall("gdiplus.dll\GdipDrawCurve2I", "ptr", graphics, "ptr", pen, "ptr", points, "int", count, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @param {Integer} offset 
     * @param {Integer} numberOfSegments 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipDrawCurve3(graphics, pen, points, count, offset, numberOfSegments, tension) {
        result := DllCall("gdiplus.dll\GdipDrawCurve3", "ptr", graphics, "ptr", pen, "ptr", points, "int", count, "int", offset, "int", numberOfSegments, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @param {Integer} offset 
     * @param {Integer} numberOfSegments 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipDrawCurve3I(graphics, pen, points, count, offset, numberOfSegments, tension) {
        result := DllCall("gdiplus.dll\GdipDrawCurve3I", "ptr", graphics, "ptr", pen, "ptr", points, "int", count, "int", offset, "int", numberOfSegments, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawClosedCurve(graphics, pen, points, count) {
        result := DllCall("gdiplus.dll\GdipDrawClosedCurve", "ptr", graphics, "ptr", pen, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawClosedCurveI(graphics, pen, points, count) {
        result := DllCall("gdiplus.dll\GdipDrawClosedCurveI", "ptr", graphics, "ptr", pen, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipDrawClosedCurve2(graphics, pen, points, count, tension) {
        result := DllCall("gdiplus.dll\GdipDrawClosedCurve2", "ptr", graphics, "ptr", pen, "ptr", points, "int", count, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipDrawClosedCurve2I(graphics, pen, points, count, tension) {
        result := DllCall("gdiplus.dll\GdipDrawClosedCurve2I", "ptr", graphics, "ptr", pen, "ptr", points, "int", count, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} color 
     * @returns {Integer} 
     */
    static GdipGraphicsClear(graphics, color) {
        result := DllCall("gdiplus.dll\GdipGraphicsClear", "ptr", graphics, "uint", color, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @returns {Integer} 
     */
    static GdipFillRectangle(graphics, brush, x, y, width, height) {
        result := DllCall("gdiplus.dll\GdipFillRectangle", "ptr", graphics, "ptr", brush, "float", x, "float", y, "float", width, "float", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {Integer} 
     */
    static GdipFillRectangleI(graphics, brush, x, y, width, height) {
        result := DllCall("gdiplus.dll\GdipFillRectangleI", "ptr", graphics, "ptr", brush, "int", x, "int", y, "int", width, "int", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<RectF>} rects 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipFillRectangles(graphics, brush, rects, count) {
        result := DllCall("gdiplus.dll\GdipFillRectangles", "ptr", graphics, "ptr", brush, "ptr", rects, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<Rect>} rects 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipFillRectanglesI(graphics, brush, rects, count) {
        result := DllCall("gdiplus.dll\GdipFillRectanglesI", "ptr", graphics, "ptr", brush, "ptr", rects, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @param {Integer} fillMode 
     * @returns {Integer} 
     */
    static GdipFillPolygon(graphics, brush, points, count, fillMode) {
        result := DllCall("gdiplus.dll\GdipFillPolygon", "ptr", graphics, "ptr", brush, "ptr", points, "int", count, "int", fillMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @param {Integer} fillMode 
     * @returns {Integer} 
     */
    static GdipFillPolygonI(graphics, brush, points, count, fillMode) {
        result := DllCall("gdiplus.dll\GdipFillPolygonI", "ptr", graphics, "ptr", brush, "ptr", points, "int", count, "int", fillMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipFillPolygon2(graphics, brush, points, count) {
        result := DllCall("gdiplus.dll\GdipFillPolygon2", "ptr", graphics, "ptr", brush, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipFillPolygon2I(graphics, brush, points, count) {
        result := DllCall("gdiplus.dll\GdipFillPolygon2I", "ptr", graphics, "ptr", brush, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @returns {Integer} 
     */
    static GdipFillEllipse(graphics, brush, x, y, width, height) {
        result := DllCall("gdiplus.dll\GdipFillEllipse", "ptr", graphics, "ptr", brush, "float", x, "float", y, "float", width, "float", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {Integer} 
     */
    static GdipFillEllipseI(graphics, brush, x, y, width, height) {
        result := DllCall("gdiplus.dll\GdipFillEllipseI", "ptr", graphics, "ptr", brush, "int", x, "int", y, "int", width, "int", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @param {Float} startAngle 
     * @param {Float} sweepAngle 
     * @returns {Integer} 
     */
    static GdipFillPie(graphics, brush, x, y, width, height, startAngle, sweepAngle) {
        result := DllCall("gdiplus.dll\GdipFillPie", "ptr", graphics, "ptr", brush, "float", x, "float", y, "float", width, "float", height, "float", startAngle, "float", sweepAngle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Float} startAngle 
     * @param {Float} sweepAngle 
     * @returns {Integer} 
     */
    static GdipFillPieI(graphics, brush, x, y, width, height, startAngle, sweepAngle) {
        result := DllCall("gdiplus.dll\GdipFillPieI", "ptr", graphics, "ptr", brush, "int", x, "int", y, "int", width, "int", height, "float", startAngle, "float", sweepAngle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<GpPath>} path 
     * @returns {Integer} 
     */
    static GdipFillPath(graphics, brush, path) {
        result := DllCall("gdiplus.dll\GdipFillPath", "ptr", graphics, "ptr", brush, "ptr", path, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipFillClosedCurve(graphics, brush, points, count) {
        result := DllCall("gdiplus.dll\GdipFillClosedCurve", "ptr", graphics, "ptr", brush, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipFillClosedCurveI(graphics, brush, points, count) {
        result := DllCall("gdiplus.dll\GdipFillClosedCurveI", "ptr", graphics, "ptr", brush, "ptr", points, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @param {Float} tension 
     * @param {Integer} fillMode 
     * @returns {Integer} 
     */
    static GdipFillClosedCurve2(graphics, brush, points, count, tension, fillMode) {
        result := DllCall("gdiplus.dll\GdipFillClosedCurve2", "ptr", graphics, "ptr", brush, "ptr", points, "int", count, "float", tension, "int", fillMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @param {Float} tension 
     * @param {Integer} fillMode 
     * @returns {Integer} 
     */
    static GdipFillClosedCurve2I(graphics, brush, points, count, tension, fillMode) {
        result := DllCall("gdiplus.dll\GdipFillClosedCurve2I", "ptr", graphics, "ptr", brush, "ptr", points, "int", count, "float", tension, "int", fillMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<GpRegion>} region 
     * @returns {Integer} 
     */
    static GdipFillRegion(graphics, brush, region) {
        result := DllCall("gdiplus.dll\GdipFillRegion", "ptr", graphics, "ptr", brush, "ptr", region, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<RectF>} source 
     * @param {Pointer<Matrix>} xForm 
     * @param {Pointer<CGpEffect>} effect 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @param {Integer} srcUnit 
     * @returns {Integer} 
     */
    static GdipDrawImageFX(graphics, image, source, xForm, effect, imageAttributes, srcUnit) {
        result := DllCall("gdiplus.dll\GdipDrawImageFX", "ptr", graphics, "ptr", image, "ptr", source, "ptr", xForm, "ptr", effect, "ptr", imageAttributes, "int", srcUnit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {Integer} 
     */
    static GdipDrawImage(graphics, image, x, y) {
        result := DllCall("gdiplus.dll\GdipDrawImage", "ptr", graphics, "ptr", image, "float", x, "float", y, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {Integer} 
     */
    static GdipDrawImageI(graphics, image, x, y) {
        result := DllCall("gdiplus.dll\GdipDrawImageI", "ptr", graphics, "ptr", image, "int", x, "int", y, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @returns {Integer} 
     */
    static GdipDrawImageRect(graphics, image, x, y, width, height) {
        result := DllCall("gdiplus.dll\GdipDrawImageRect", "ptr", graphics, "ptr", image, "float", x, "float", y, "float", width, "float", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {Integer} 
     */
    static GdipDrawImageRectI(graphics, image, x, y, width, height) {
        result := DllCall("gdiplus.dll\GdipDrawImageRectI", "ptr", graphics, "ptr", image, "int", x, "int", y, "int", width, "int", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<PointF>} dstpoints 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawImagePoints(graphics, image, dstpoints, count) {
        result := DllCall("gdiplus.dll\GdipDrawImagePoints", "ptr", graphics, "ptr", image, "ptr", dstpoints, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<Point>} dstpoints 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawImagePointsI(graphics, image, dstpoints, count) {
        result := DllCall("gdiplus.dll\GdipDrawImagePointsI", "ptr", graphics, "ptr", image, "ptr", dstpoints, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} srcx 
     * @param {Float} srcy 
     * @param {Float} srcwidth 
     * @param {Float} srcheight 
     * @param {Integer} srcUnit 
     * @returns {Integer} 
     */
    static GdipDrawImagePointRect(graphics, image, x, y, srcx, srcy, srcwidth, srcheight, srcUnit) {
        result := DllCall("gdiplus.dll\GdipDrawImagePointRect", "ptr", graphics, "ptr", image, "float", x, "float", y, "float", srcx, "float", srcy, "float", srcwidth, "float", srcheight, "int", srcUnit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} srcx 
     * @param {Integer} srcy 
     * @param {Integer} srcwidth 
     * @param {Integer} srcheight 
     * @param {Integer} srcUnit 
     * @returns {Integer} 
     */
    static GdipDrawImagePointRectI(graphics, image, x, y, srcx, srcy, srcwidth, srcheight, srcUnit) {
        result := DllCall("gdiplus.dll\GdipDrawImagePointRectI", "ptr", graphics, "ptr", image, "int", x, "int", y, "int", srcx, "int", srcy, "int", srcwidth, "int", srcheight, "int", srcUnit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image 
     * @param {Float} dstx 
     * @param {Float} dsty 
     * @param {Float} dstwidth 
     * @param {Float} dstheight 
     * @param {Float} srcx 
     * @param {Float} srcy 
     * @param {Float} srcwidth 
     * @param {Float} srcheight 
     * @param {Integer} srcUnit 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @returns {Integer} 
     */
    static GdipDrawImageRectRect(graphics, image, dstx, dsty, dstwidth, dstheight, srcx, srcy, srcwidth, srcheight, srcUnit, imageAttributes, callback, callbackData) {
        result := DllCall("gdiplus.dll\GdipDrawImageRectRect", "ptr", graphics, "ptr", image, "float", dstx, "float", dsty, "float", dstwidth, "float", dstheight, "float", srcx, "float", srcy, "float", srcwidth, "float", srcheight, "int", srcUnit, "ptr", imageAttributes, "ptr", callback, "ptr", callbackData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image 
     * @param {Integer} dstx 
     * @param {Integer} dsty 
     * @param {Integer} dstwidth 
     * @param {Integer} dstheight 
     * @param {Integer} srcx 
     * @param {Integer} srcy 
     * @param {Integer} srcwidth 
     * @param {Integer} srcheight 
     * @param {Integer} srcUnit 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @returns {Integer} 
     */
    static GdipDrawImageRectRectI(graphics, image, dstx, dsty, dstwidth, dstheight, srcx, srcy, srcwidth, srcheight, srcUnit, imageAttributes, callback, callbackData) {
        result := DllCall("gdiplus.dll\GdipDrawImageRectRectI", "ptr", graphics, "ptr", image, "int", dstx, "int", dsty, "int", dstwidth, "int", dstheight, "int", srcx, "int", srcy, "int", srcwidth, "int", srcheight, "int", srcUnit, "ptr", imageAttributes, "ptr", callback, "ptr", callbackData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<PointF>} points 
     * @param {Integer} count 
     * @param {Float} srcx 
     * @param {Float} srcy 
     * @param {Float} srcwidth 
     * @param {Float} srcheight 
     * @param {Integer} srcUnit 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @returns {Integer} 
     */
    static GdipDrawImagePointsRect(graphics, image, points, count, srcx, srcy, srcwidth, srcheight, srcUnit, imageAttributes, callback, callbackData) {
        result := DllCall("gdiplus.dll\GdipDrawImagePointsRect", "ptr", graphics, "ptr", image, "ptr", points, "int", count, "float", srcx, "float", srcy, "float", srcwidth, "float", srcheight, "int", srcUnit, "ptr", imageAttributes, "ptr", callback, "ptr", callbackData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image 
     * @param {Pointer<Point>} points 
     * @param {Integer} count 
     * @param {Integer} srcx 
     * @param {Integer} srcy 
     * @param {Integer} srcwidth 
     * @param {Integer} srcheight 
     * @param {Integer} srcUnit 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @returns {Integer} 
     */
    static GdipDrawImagePointsRectI(graphics, image, points, count, srcx, srcy, srcwidth, srcheight, srcUnit, imageAttributes, callback, callbackData) {
        result := DllCall("gdiplus.dll\GdipDrawImagePointsRectI", "ptr", graphics, "ptr", image, "ptr", points, "int", count, "int", srcx, "int", srcy, "int", srcwidth, "int", srcheight, "int", srcUnit, "ptr", imageAttributes, "ptr", callback, "ptr", callbackData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile 
     * @param {Pointer<PointF>} destPoint 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileDestPoint(graphics, metafile, destPoint, callback, callbackData, imageAttributes) {
        result := DllCall("gdiplus.dll\GdipEnumerateMetafileDestPoint", "ptr", graphics, "ptr", metafile, "ptr", destPoint, "ptr", callback, "ptr", callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile 
     * @param {Pointer<Point>} destPoint 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileDestPointI(graphics, metafile, destPoint, callback, callbackData, imageAttributes) {
        result := DllCall("gdiplus.dll\GdipEnumerateMetafileDestPointI", "ptr", graphics, "ptr", metafile, "ptr", destPoint, "ptr", callback, "ptr", callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile 
     * @param {Pointer<RectF>} destRect 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileDestRect(graphics, metafile, destRect, callback, callbackData, imageAttributes) {
        result := DllCall("gdiplus.dll\GdipEnumerateMetafileDestRect", "ptr", graphics, "ptr", metafile, "ptr", destRect, "ptr", callback, "ptr", callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile 
     * @param {Pointer<Rect>} destRect 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileDestRectI(graphics, metafile, destRect, callback, callbackData, imageAttributes) {
        result := DllCall("gdiplus.dll\GdipEnumerateMetafileDestRectI", "ptr", graphics, "ptr", metafile, "ptr", destRect, "ptr", callback, "ptr", callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile 
     * @param {Pointer<PointF>} destPoints 
     * @param {Integer} count 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileDestPoints(graphics, metafile, destPoints, count, callback, callbackData, imageAttributes) {
        result := DllCall("gdiplus.dll\GdipEnumerateMetafileDestPoints", "ptr", graphics, "ptr", metafile, "ptr", destPoints, "int", count, "ptr", callback, "ptr", callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile 
     * @param {Pointer<Point>} destPoints 
     * @param {Integer} count 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileDestPointsI(graphics, metafile, destPoints, count, callback, callbackData, imageAttributes) {
        result := DllCall("gdiplus.dll\GdipEnumerateMetafileDestPointsI", "ptr", graphics, "ptr", metafile, "ptr", destPoints, "int", count, "ptr", callback, "ptr", callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile 
     * @param {Pointer<PointF>} destPoint 
     * @param {Pointer<RectF>} srcRect 
     * @param {Integer} srcUnit 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileSrcRectDestPoint(graphics, metafile, destPoint, srcRect, srcUnit, callback, callbackData, imageAttributes) {
        result := DllCall("gdiplus.dll\GdipEnumerateMetafileSrcRectDestPoint", "ptr", graphics, "ptr", metafile, "ptr", destPoint, "ptr", srcRect, "int", srcUnit, "ptr", callback, "ptr", callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile 
     * @param {Pointer<Point>} destPoint 
     * @param {Pointer<Rect>} srcRect 
     * @param {Integer} srcUnit 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileSrcRectDestPointI(graphics, metafile, destPoint, srcRect, srcUnit, callback, callbackData, imageAttributes) {
        result := DllCall("gdiplus.dll\GdipEnumerateMetafileSrcRectDestPointI", "ptr", graphics, "ptr", metafile, "ptr", destPoint, "ptr", srcRect, "int", srcUnit, "ptr", callback, "ptr", callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile 
     * @param {Pointer<RectF>} destRect 
     * @param {Pointer<RectF>} srcRect 
     * @param {Integer} srcUnit 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileSrcRectDestRect(graphics, metafile, destRect, srcRect, srcUnit, callback, callbackData, imageAttributes) {
        result := DllCall("gdiplus.dll\GdipEnumerateMetafileSrcRectDestRect", "ptr", graphics, "ptr", metafile, "ptr", destRect, "ptr", srcRect, "int", srcUnit, "ptr", callback, "ptr", callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile 
     * @param {Pointer<Rect>} destRect 
     * @param {Pointer<Rect>} srcRect 
     * @param {Integer} srcUnit 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileSrcRectDestRectI(graphics, metafile, destRect, srcRect, srcUnit, callback, callbackData, imageAttributes) {
        result := DllCall("gdiplus.dll\GdipEnumerateMetafileSrcRectDestRectI", "ptr", graphics, "ptr", metafile, "ptr", destRect, "ptr", srcRect, "int", srcUnit, "ptr", callback, "ptr", callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile 
     * @param {Pointer<PointF>} destPoints 
     * @param {Integer} count 
     * @param {Pointer<RectF>} srcRect 
     * @param {Integer} srcUnit 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileSrcRectDestPoints(graphics, metafile, destPoints, count, srcRect, srcUnit, callback, callbackData, imageAttributes) {
        result := DllCall("gdiplus.dll\GdipEnumerateMetafileSrcRectDestPoints", "ptr", graphics, "ptr", metafile, "ptr", destPoints, "int", count, "ptr", srcRect, "int", srcUnit, "ptr", callback, "ptr", callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile 
     * @param {Pointer<Point>} destPoints 
     * @param {Integer} count 
     * @param {Pointer<Rect>} srcRect 
     * @param {Integer} srcUnit 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileSrcRectDestPointsI(graphics, metafile, destPoints, count, srcRect, srcUnit, callback, callbackData, imageAttributes) {
        result := DllCall("gdiplus.dll\GdipEnumerateMetafileSrcRectDestPointsI", "ptr", graphics, "ptr", metafile, "ptr", destPoints, "int", count, "ptr", srcRect, "int", srcUnit, "ptr", callback, "ptr", callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpMetafile>} metafile 
     * @param {Integer} recordType 
     * @param {Integer} flags 
     * @param {Integer} dataSize 
     * @param {Pointer<Byte>} data 
     * @returns {Integer} 
     */
    static GdipPlayMetafileRecord(metafile, recordType, flags, dataSize, data) {
        result := DllCall("gdiplus.dll\GdipPlayMetafileRecord", "ptr", metafile, "int", recordType, "uint", flags, "uint", dataSize, "char*", data, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpGraphics>} srcgraphics 
     * @param {Integer} combineMode 
     * @returns {Integer} 
     */
    static GdipSetClipGraphics(graphics, srcgraphics, combineMode) {
        result := DllCall("gdiplus.dll\GdipSetClipGraphics", "ptr", graphics, "ptr", srcgraphics, "int", combineMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @param {Integer} combineMode 
     * @returns {Integer} 
     */
    static GdipSetClipRect(graphics, x, y, width, height, combineMode) {
        result := DllCall("gdiplus.dll\GdipSetClipRect", "ptr", graphics, "float", x, "float", y, "float", width, "float", height, "int", combineMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} combineMode 
     * @returns {Integer} 
     */
    static GdipSetClipRectI(graphics, x, y, width, height, combineMode) {
        result := DllCall("gdiplus.dll\GdipSetClipRectI", "ptr", graphics, "int", x, "int", y, "int", width, "int", height, "int", combineMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPath>} path 
     * @param {Integer} combineMode 
     * @returns {Integer} 
     */
    static GdipSetClipPath(graphics, path, combineMode) {
        result := DllCall("gdiplus.dll\GdipSetClipPath", "ptr", graphics, "ptr", path, "int", combineMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpRegion>} region 
     * @param {Integer} combineMode 
     * @returns {Integer} 
     */
    static GdipSetClipRegion(graphics, region, combineMode) {
        result := DllCall("gdiplus.dll\GdipSetClipRegion", "ptr", graphics, "ptr", region, "int", combineMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {HRGN} hRgn 
     * @param {Integer} combineMode 
     * @returns {Integer} 
     */
    static GdipSetClipHrgn(graphics, hRgn, combineMode) {
        hRgn := hRgn is Win32Handle ? NumGet(hRgn, "ptr") : hRgn

        result := DllCall("gdiplus.dll\GdipSetClipHrgn", "ptr", graphics, "ptr", hRgn, "int", combineMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @returns {Integer} 
     */
    static GdipResetClip(graphics) {
        result := DllCall("gdiplus.dll\GdipResetClip", "ptr", graphics, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Float} dx 
     * @param {Float} dy 
     * @returns {Integer} 
     */
    static GdipTranslateClip(graphics, dx, dy) {
        result := DllCall("gdiplus.dll\GdipTranslateClip", "ptr", graphics, "float", dx, "float", dy, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} dx 
     * @param {Integer} dy 
     * @returns {Integer} 
     */
    static GdipTranslateClipI(graphics, dx, dy) {
        result := DllCall("gdiplus.dll\GdipTranslateClipI", "ptr", graphics, "int", dx, "int", dy, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpRegion>} region 
     * @returns {Integer} 
     */
    static GdipGetClip(graphics, region) {
        result := DllCall("gdiplus.dll\GdipGetClip", "ptr", graphics, "ptr", region, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<RectF>} rect 
     * @returns {Integer} 
     */
    static GdipGetClipBounds(graphics, rect) {
        result := DllCall("gdiplus.dll\GdipGetClipBounds", "ptr", graphics, "ptr", rect, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Rect>} rect 
     * @returns {Integer} 
     */
    static GdipGetClipBoundsI(graphics, rect) {
        result := DllCall("gdiplus.dll\GdipGetClipBoundsI", "ptr", graphics, "ptr", rect, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result 
     * @returns {Integer} 
     */
    static GdipIsClipEmpty(graphics, result) {
        result := DllCall("gdiplus.dll\GdipIsClipEmpty", "ptr", graphics, "ptr", result, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<RectF>} rect 
     * @returns {Integer} 
     */
    static GdipGetVisibleClipBounds(graphics, rect) {
        result := DllCall("gdiplus.dll\GdipGetVisibleClipBounds", "ptr", graphics, "ptr", rect, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Rect>} rect 
     * @returns {Integer} 
     */
    static GdipGetVisibleClipBoundsI(graphics, rect) {
        result := DllCall("gdiplus.dll\GdipGetVisibleClipBoundsI", "ptr", graphics, "ptr", rect, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result 
     * @returns {Integer} 
     */
    static GdipIsVisibleClipEmpty(graphics, result) {
        result := DllCall("gdiplus.dll\GdipIsVisibleClipEmpty", "ptr", graphics, "ptr", result, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Pointer<BOOL>} result 
     * @returns {Integer} 
     */
    static GdipIsVisiblePoint(graphics, x, y, result) {
        result := DllCall("gdiplus.dll\GdipIsVisiblePoint", "ptr", graphics, "float", x, "float", y, "ptr", result, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Pointer<BOOL>} result 
     * @returns {Integer} 
     */
    static GdipIsVisiblePointI(graphics, x, y, result) {
        result := DllCall("gdiplus.dll\GdipIsVisiblePointI", "ptr", graphics, "int", x, "int", y, "ptr", result, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @param {Pointer<BOOL>} result 
     * @returns {Integer} 
     */
    static GdipIsVisibleRect(graphics, x, y, width, height, result) {
        result := DllCall("gdiplus.dll\GdipIsVisibleRect", "ptr", graphics, "float", x, "float", y, "float", width, "float", height, "ptr", result, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Pointer<BOOL>} result 
     * @returns {Integer} 
     */
    static GdipIsVisibleRectI(graphics, x, y, width, height, result) {
        result := DllCall("gdiplus.dll\GdipIsVisibleRectI", "ptr", graphics, "int", x, "int", y, "int", width, "int", height, "ptr", result, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<UInt32>} state 
     * @returns {Integer} 
     */
    static GdipSaveGraphics(graphics, state) {
        result := DllCall("gdiplus.dll\GdipSaveGraphics", "ptr", graphics, "uint*", state, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} state 
     * @returns {Integer} 
     */
    static GdipRestoreGraphics(graphics, state) {
        result := DllCall("gdiplus.dll\GdipRestoreGraphics", "ptr", graphics, "uint", state, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<RectF>} dstrect 
     * @param {Pointer<RectF>} srcrect 
     * @param {Integer} unit 
     * @param {Pointer<UInt32>} state 
     * @returns {Integer} 
     */
    static GdipBeginContainer(graphics, dstrect, srcrect, unit, state) {
        result := DllCall("gdiplus.dll\GdipBeginContainer", "ptr", graphics, "ptr", dstrect, "ptr", srcrect, "int", unit, "uint*", state, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Rect>} dstrect 
     * @param {Pointer<Rect>} srcrect 
     * @param {Integer} unit 
     * @param {Pointer<UInt32>} state 
     * @returns {Integer} 
     */
    static GdipBeginContainerI(graphics, dstrect, srcrect, unit, state) {
        result := DllCall("gdiplus.dll\GdipBeginContainerI", "ptr", graphics, "ptr", dstrect, "ptr", srcrect, "int", unit, "uint*", state, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<UInt32>} state 
     * @returns {Integer} 
     */
    static GdipBeginContainer2(graphics, state) {
        result := DllCall("gdiplus.dll\GdipBeginContainer2", "ptr", graphics, "uint*", state, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} state 
     * @returns {Integer} 
     */
    static GdipEndContainer(graphics, state) {
        result := DllCall("gdiplus.dll\GdipEndContainer", "ptr", graphics, "uint", state, "int")
        return result
    }

    /**
     * 
     * @param {HMETAFILE} hWmf 
     * @param {Pointer<WmfPlaceableFileHeader>} wmfPlaceableFileHeader 
     * @param {Pointer<MetafileHeader>} header 
     * @returns {Integer} 
     */
    static GdipGetMetafileHeaderFromWmf(hWmf, wmfPlaceableFileHeader, header) {
        hWmf := hWmf is Win32Handle ? NumGet(hWmf, "ptr") : hWmf

        result := DllCall("gdiplus.dll\GdipGetMetafileHeaderFromWmf", "ptr", hWmf, "ptr", wmfPlaceableFileHeader, "ptr", header, "int")
        return result
    }

    /**
     * 
     * @param {HENHMETAFILE} hEmf 
     * @param {Pointer<MetafileHeader>} header 
     * @returns {Integer} 
     */
    static GdipGetMetafileHeaderFromEmf(hEmf, header) {
        hEmf := hEmf is Win32Handle ? NumGet(hEmf, "ptr") : hEmf

        result := DllCall("gdiplus.dll\GdipGetMetafileHeaderFromEmf", "ptr", hEmf, "ptr", header, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} filename 
     * @param {Pointer<MetafileHeader>} header 
     * @returns {Integer} 
     */
    static GdipGetMetafileHeaderFromFile(filename, header) {
        filename := filename is String ? StrPtr(filename) : filename

        result := DllCall("gdiplus.dll\GdipGetMetafileHeaderFromFile", "ptr", filename, "ptr", header, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} stream 
     * @param {Pointer<MetafileHeader>} header 
     * @returns {Integer} 
     */
    static GdipGetMetafileHeaderFromStream(stream, header) {
        result := DllCall("gdiplus.dll\GdipGetMetafileHeaderFromStream", "ptr", stream, "ptr", header, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpMetafile>} metafile 
     * @param {Pointer<MetafileHeader>} header 
     * @returns {Integer} 
     */
    static GdipGetMetafileHeaderFromMetafile(metafile, header) {
        result := DllCall("gdiplus.dll\GdipGetMetafileHeaderFromMetafile", "ptr", metafile, "ptr", header, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpMetafile>} metafile 
     * @param {Pointer<HENHMETAFILE>} hEmf 
     * @returns {Integer} 
     */
    static GdipGetHemfFromMetafile(metafile, hEmf) {
        result := DllCall("gdiplus.dll\GdipGetHemfFromMetafile", "ptr", metafile, "ptr", hEmf, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} filename 
     * @param {Integer} access 
     * @param {Pointer<IStream>} stream 
     * @returns {Integer} 
     */
    static GdipCreateStreamOnFile(filename, access, stream) {
        filename := filename is String ? StrPtr(filename) : filename

        result := DllCall("gdiplus.dll\GdipCreateStreamOnFile", "ptr", filename, "uint", access, "ptr", stream, "int")
        return result
    }

    /**
     * 
     * @param {HMETAFILE} hWmf 
     * @param {BOOL} deleteWmf 
     * @param {Pointer<WmfPlaceableFileHeader>} wmfPlaceableFileHeader 
     * @param {Pointer<GpMetafile>} metafile 
     * @returns {Integer} 
     */
    static GdipCreateMetafileFromWmf(hWmf, deleteWmf, wmfPlaceableFileHeader, metafile) {
        hWmf := hWmf is Win32Handle ? NumGet(hWmf, "ptr") : hWmf

        result := DllCall("gdiplus.dll\GdipCreateMetafileFromWmf", "ptr", hWmf, "int", deleteWmf, "ptr", wmfPlaceableFileHeader, "ptr", metafile, "int")
        return result
    }

    /**
     * 
     * @param {HENHMETAFILE} hEmf 
     * @param {BOOL} deleteEmf 
     * @param {Pointer<GpMetafile>} metafile 
     * @returns {Integer} 
     */
    static GdipCreateMetafileFromEmf(hEmf, deleteEmf, metafile) {
        hEmf := hEmf is Win32Handle ? NumGet(hEmf, "ptr") : hEmf

        result := DllCall("gdiplus.dll\GdipCreateMetafileFromEmf", "ptr", hEmf, "int", deleteEmf, "ptr", metafile, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} file 
     * @param {Pointer<GpMetafile>} metafile 
     * @returns {Integer} 
     */
    static GdipCreateMetafileFromFile(file, metafile) {
        file := file is String ? StrPtr(file) : file

        result := DllCall("gdiplus.dll\GdipCreateMetafileFromFile", "ptr", file, "ptr", metafile, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} file 
     * @param {Pointer<WmfPlaceableFileHeader>} wmfPlaceableFileHeader 
     * @param {Pointer<GpMetafile>} metafile 
     * @returns {Integer} 
     */
    static GdipCreateMetafileFromWmfFile(file, wmfPlaceableFileHeader, metafile) {
        file := file is String ? StrPtr(file) : file

        result := DllCall("gdiplus.dll\GdipCreateMetafileFromWmfFile", "ptr", file, "ptr", wmfPlaceableFileHeader, "ptr", metafile, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} stream 
     * @param {Pointer<GpMetafile>} metafile 
     * @returns {Integer} 
     */
    static GdipCreateMetafileFromStream(stream, metafile) {
        result := DllCall("gdiplus.dll\GdipCreateMetafileFromStream", "ptr", stream, "ptr", metafile, "int")
        return result
    }

    /**
     * 
     * @param {HDC} referenceHdc 
     * @param {Integer} type 
     * @param {Pointer<RectF>} frameRect 
     * @param {Integer} frameUnit 
     * @param {PWSTR} description 
     * @param {Pointer<GpMetafile>} metafile 
     * @returns {Integer} 
     */
    static GdipRecordMetafile(referenceHdc, type, frameRect, frameUnit, description, metafile) {
        description := description is String ? StrPtr(description) : description
        referenceHdc := referenceHdc is Win32Handle ? NumGet(referenceHdc, "ptr") : referenceHdc

        result := DllCall("gdiplus.dll\GdipRecordMetafile", "ptr", referenceHdc, "int", type, "ptr", frameRect, "int", frameUnit, "ptr", description, "ptr", metafile, "int")
        return result
    }

    /**
     * 
     * @param {HDC} referenceHdc 
     * @param {Integer} type 
     * @param {Pointer<Rect>} frameRect 
     * @param {Integer} frameUnit 
     * @param {PWSTR} description 
     * @param {Pointer<GpMetafile>} metafile 
     * @returns {Integer} 
     */
    static GdipRecordMetafileI(referenceHdc, type, frameRect, frameUnit, description, metafile) {
        description := description is String ? StrPtr(description) : description
        referenceHdc := referenceHdc is Win32Handle ? NumGet(referenceHdc, "ptr") : referenceHdc

        result := DllCall("gdiplus.dll\GdipRecordMetafileI", "ptr", referenceHdc, "int", type, "ptr", frameRect, "int", frameUnit, "ptr", description, "ptr", metafile, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} fileName 
     * @param {HDC} referenceHdc 
     * @param {Integer} type 
     * @param {Pointer<RectF>} frameRect 
     * @param {Integer} frameUnit 
     * @param {PWSTR} description 
     * @param {Pointer<GpMetafile>} metafile 
     * @returns {Integer} 
     */
    static GdipRecordMetafileFileName(fileName, referenceHdc, type, frameRect, frameUnit, description, metafile) {
        fileName := fileName is String ? StrPtr(fileName) : fileName
        description := description is String ? StrPtr(description) : description
        referenceHdc := referenceHdc is Win32Handle ? NumGet(referenceHdc, "ptr") : referenceHdc

        result := DllCall("gdiplus.dll\GdipRecordMetafileFileName", "ptr", fileName, "ptr", referenceHdc, "int", type, "ptr", frameRect, "int", frameUnit, "ptr", description, "ptr", metafile, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} fileName 
     * @param {HDC} referenceHdc 
     * @param {Integer} type 
     * @param {Pointer<Rect>} frameRect 
     * @param {Integer} frameUnit 
     * @param {PWSTR} description 
     * @param {Pointer<GpMetafile>} metafile 
     * @returns {Integer} 
     */
    static GdipRecordMetafileFileNameI(fileName, referenceHdc, type, frameRect, frameUnit, description, metafile) {
        fileName := fileName is String ? StrPtr(fileName) : fileName
        description := description is String ? StrPtr(description) : description
        referenceHdc := referenceHdc is Win32Handle ? NumGet(referenceHdc, "ptr") : referenceHdc

        result := DllCall("gdiplus.dll\GdipRecordMetafileFileNameI", "ptr", fileName, "ptr", referenceHdc, "int", type, "ptr", frameRect, "int", frameUnit, "ptr", description, "ptr", metafile, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} stream 
     * @param {HDC} referenceHdc 
     * @param {Integer} type 
     * @param {Pointer<RectF>} frameRect 
     * @param {Integer} frameUnit 
     * @param {PWSTR} description 
     * @param {Pointer<GpMetafile>} metafile 
     * @returns {Integer} 
     */
    static GdipRecordMetafileStream(stream, referenceHdc, type, frameRect, frameUnit, description, metafile) {
        description := description is String ? StrPtr(description) : description
        referenceHdc := referenceHdc is Win32Handle ? NumGet(referenceHdc, "ptr") : referenceHdc

        result := DllCall("gdiplus.dll\GdipRecordMetafileStream", "ptr", stream, "ptr", referenceHdc, "int", type, "ptr", frameRect, "int", frameUnit, "ptr", description, "ptr", metafile, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} stream 
     * @param {HDC} referenceHdc 
     * @param {Integer} type 
     * @param {Pointer<Rect>} frameRect 
     * @param {Integer} frameUnit 
     * @param {PWSTR} description 
     * @param {Pointer<GpMetafile>} metafile 
     * @returns {Integer} 
     */
    static GdipRecordMetafileStreamI(stream, referenceHdc, type, frameRect, frameUnit, description, metafile) {
        description := description is String ? StrPtr(description) : description
        referenceHdc := referenceHdc is Win32Handle ? NumGet(referenceHdc, "ptr") : referenceHdc

        result := DllCall("gdiplus.dll\GdipRecordMetafileStreamI", "ptr", stream, "ptr", referenceHdc, "int", type, "ptr", frameRect, "int", frameUnit, "ptr", description, "ptr", metafile, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpMetafile>} metafile 
     * @param {Integer} metafileRasterizationLimitDpi 
     * @returns {Integer} 
     */
    static GdipSetMetafileDownLevelRasterizationLimit(metafile, metafileRasterizationLimitDpi) {
        result := DllCall("gdiplus.dll\GdipSetMetafileDownLevelRasterizationLimit", "ptr", metafile, "uint", metafileRasterizationLimitDpi, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpMetafile>} metafile 
     * @param {Pointer<UInt32>} metafileRasterizationLimitDpi 
     * @returns {Integer} 
     */
    static GdipGetMetafileDownLevelRasterizationLimit(metafile, metafileRasterizationLimitDpi) {
        result := DllCall("gdiplus.dll\GdipGetMetafileDownLevelRasterizationLimit", "ptr", metafile, "uint*", metafileRasterizationLimitDpi, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} numDecoders 
     * @param {Pointer<UInt32>} size 
     * @returns {Integer} 
     */
    static GdipGetImageDecodersSize(numDecoders, size) {
        result := DllCall("gdiplus.dll\GdipGetImageDecodersSize", "uint*", numDecoders, "uint*", size, "int")
        return result
    }

    /**
     * 
     * @param {Integer} numDecoders 
     * @param {Integer} size 
     * @param {Pointer} decoders 
     * @returns {Integer} 
     */
    static GdipGetImageDecoders(numDecoders, size, decoders) {
        result := DllCall("gdiplus.dll\GdipGetImageDecoders", "uint", numDecoders, "uint", size, "ptr", decoders, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} numEncoders 
     * @param {Pointer<UInt32>} size 
     * @returns {Integer} 
     */
    static GdipGetImageEncodersSize(numEncoders, size) {
        result := DllCall("gdiplus.dll\GdipGetImageEncodersSize", "uint*", numEncoders, "uint*", size, "int")
        return result
    }

    /**
     * 
     * @param {Integer} numEncoders 
     * @param {Integer} size 
     * @param {Pointer} encoders 
     * @returns {Integer} 
     */
    static GdipGetImageEncoders(numEncoders, size, encoders) {
        result := DllCall("gdiplus.dll\GdipGetImageEncoders", "uint", numEncoders, "uint", size, "ptr", encoders, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} sizeData 
     * @param {Pointer<Byte>} data 
     * @returns {Integer} 
     */
    static GdipComment(graphics, sizeData, data) {
        result := DllCall("gdiplus.dll\GdipComment", "ptr", graphics, "uint", sizeData, "char*", data, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Pointer<GpFontCollection>} fontCollection 
     * @param {Pointer<GpFontFamily>} fontFamily 
     * @returns {Integer} 
     */
    static GdipCreateFontFamilyFromName(name, fontCollection, fontFamily) {
        name := name is String ? StrPtr(name) : name

        result := DllCall("gdiplus.dll\GdipCreateFontFamilyFromName", "ptr", name, "ptr", fontCollection, "ptr", fontFamily, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontFamily>} fontFamily 
     * @returns {Integer} 
     */
    static GdipDeleteFontFamily(fontFamily) {
        result := DllCall("gdiplus.dll\GdipDeleteFontFamily", "ptr", fontFamily, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontFamily>} fontFamily 
     * @param {Pointer<GpFontFamily>} clonedFontFamily 
     * @returns {Integer} 
     */
    static GdipCloneFontFamily(fontFamily, clonedFontFamily) {
        result := DllCall("gdiplus.dll\GdipCloneFontFamily", "ptr", fontFamily, "ptr", clonedFontFamily, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontFamily>} nativeFamily 
     * @returns {Integer} 
     */
    static GdipGetGenericFontFamilySansSerif(nativeFamily) {
        result := DllCall("gdiplus.dll\GdipGetGenericFontFamilySansSerif", "ptr", nativeFamily, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontFamily>} nativeFamily 
     * @returns {Integer} 
     */
    static GdipGetGenericFontFamilySerif(nativeFamily) {
        result := DllCall("gdiplus.dll\GdipGetGenericFontFamilySerif", "ptr", nativeFamily, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontFamily>} nativeFamily 
     * @returns {Integer} 
     */
    static GdipGetGenericFontFamilyMonospace(nativeFamily) {
        result := DllCall("gdiplus.dll\GdipGetGenericFontFamilyMonospace", "ptr", nativeFamily, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontFamily>} family 
     * @param {PWSTR} name 
     * @param {Integer} language 
     * @returns {Integer} 
     */
    static GdipGetFamilyName(family, name, language) {
        name := name is String ? StrPtr(name) : name

        result := DllCall("gdiplus.dll\GdipGetFamilyName", "ptr", family, "ptr", name, "ushort", language, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontFamily>} family 
     * @param {Integer} style 
     * @param {Pointer<BOOL>} IsStyleAvailable 
     * @returns {Integer} 
     */
    static GdipIsStyleAvailable(family, style, IsStyleAvailable) {
        result := DllCall("gdiplus.dll\GdipIsStyleAvailable", "ptr", family, "int", style, "ptr", IsStyleAvailable, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontFamily>} family 
     * @param {Integer} style 
     * @param {Pointer<UInt16>} EmHeight 
     * @returns {Integer} 
     */
    static GdipGetEmHeight(family, style, EmHeight) {
        result := DllCall("gdiplus.dll\GdipGetEmHeight", "ptr", family, "int", style, "ushort*", EmHeight, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontFamily>} family 
     * @param {Integer} style 
     * @param {Pointer<UInt16>} CellAscent 
     * @returns {Integer} 
     */
    static GdipGetCellAscent(family, style, CellAscent) {
        result := DllCall("gdiplus.dll\GdipGetCellAscent", "ptr", family, "int", style, "ushort*", CellAscent, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontFamily>} family 
     * @param {Integer} style 
     * @param {Pointer<UInt16>} CellDescent 
     * @returns {Integer} 
     */
    static GdipGetCellDescent(family, style, CellDescent) {
        result := DllCall("gdiplus.dll\GdipGetCellDescent", "ptr", family, "int", style, "ushort*", CellDescent, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontFamily>} family 
     * @param {Integer} style 
     * @param {Pointer<UInt16>} LineSpacing 
     * @returns {Integer} 
     */
    static GdipGetLineSpacing(family, style, LineSpacing) {
        result := DllCall("gdiplus.dll\GdipGetLineSpacing", "ptr", family, "int", style, "ushort*", LineSpacing, "int")
        return result
    }

    /**
     * 
     * @param {HDC} hdc 
     * @param {Pointer<GpFont>} font 
     * @returns {Integer} 
     */
    static GdipCreateFontFromDC(hdc, font) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("gdiplus.dll\GdipCreateFontFromDC", "ptr", hdc, "ptr", font, "int")
        return result
    }

    /**
     * 
     * @param {HDC} hdc 
     * @param {Pointer<LOGFONTA>} logfont 
     * @param {Pointer<GpFont>} font 
     * @returns {Integer} 
     */
    static GdipCreateFontFromLogfontA(hdc, logfont, font) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("gdiplus.dll\GdipCreateFontFromLogfontA", "ptr", hdc, "ptr", logfont, "ptr", font, "int")
        return result
    }

    /**
     * 
     * @param {HDC} hdc 
     * @param {Pointer<LOGFONTW>} logfont 
     * @param {Pointer<GpFont>} font 
     * @returns {Integer} 
     */
    static GdipCreateFontFromLogfontW(hdc, logfont, font) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := DllCall("gdiplus.dll\GdipCreateFontFromLogfontW", "ptr", hdc, "ptr", logfont, "ptr", font, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontFamily>} fontFamily 
     * @param {Float} emSize 
     * @param {Integer} style 
     * @param {Integer} unit 
     * @param {Pointer<GpFont>} font 
     * @returns {Integer} 
     */
    static GdipCreateFont(fontFamily, emSize, style, unit, font) {
        result := DllCall("gdiplus.dll\GdipCreateFont", "ptr", fontFamily, "float", emSize, "int", style, "int", unit, "ptr", font, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFont>} font 
     * @param {Pointer<GpFont>} cloneFont 
     * @returns {Integer} 
     */
    static GdipCloneFont(font, cloneFont) {
        result := DllCall("gdiplus.dll\GdipCloneFont", "ptr", font, "ptr", cloneFont, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFont>} font 
     * @returns {Integer} 
     */
    static GdipDeleteFont(font) {
        result := DllCall("gdiplus.dll\GdipDeleteFont", "ptr", font, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFont>} font 
     * @param {Pointer<GpFontFamily>} family 
     * @returns {Integer} 
     */
    static GdipGetFamily(font, family) {
        result := DllCall("gdiplus.dll\GdipGetFamily", "ptr", font, "ptr", family, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFont>} font 
     * @param {Pointer<Int32>} style 
     * @returns {Integer} 
     */
    static GdipGetFontStyle(font, style) {
        result := DllCall("gdiplus.dll\GdipGetFontStyle", "ptr", font, "int*", style, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFont>} font 
     * @param {Pointer<Single>} size 
     * @returns {Integer} 
     */
    static GdipGetFontSize(font, size) {
        result := DllCall("gdiplus.dll\GdipGetFontSize", "ptr", font, "float*", size, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFont>} font 
     * @param {Pointer<Int32>} unit 
     * @returns {Integer} 
     */
    static GdipGetFontUnit(font, unit) {
        result := DllCall("gdiplus.dll\GdipGetFontUnit", "ptr", font, "int*", unit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFont>} font 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Single>} height 
     * @returns {Integer} 
     */
    static GdipGetFontHeight(font, graphics, height) {
        result := DllCall("gdiplus.dll\GdipGetFontHeight", "ptr", font, "ptr", graphics, "float*", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFont>} font 
     * @param {Float} dpi 
     * @param {Pointer<Single>} height 
     * @returns {Integer} 
     */
    static GdipGetFontHeightGivenDPI(font, dpi, height) {
        result := DllCall("gdiplus.dll\GdipGetFontHeightGivenDPI", "ptr", font, "float", dpi, "float*", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFont>} font 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<LOGFONTA>} logfontA 
     * @returns {Integer} 
     */
    static GdipGetLogFontA(font, graphics, logfontA) {
        result := DllCall("gdiplus.dll\GdipGetLogFontA", "ptr", font, "ptr", graphics, "ptr", logfontA, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFont>} font 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<LOGFONTW>} logfontW 
     * @returns {Integer} 
     */
    static GdipGetLogFontW(font, graphics, logfontW) {
        result := DllCall("gdiplus.dll\GdipGetLogFontW", "ptr", font, "ptr", graphics, "ptr", logfontW, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontCollection>} fontCollection 
     * @returns {Integer} 
     */
    static GdipNewInstalledFontCollection(fontCollection) {
        result := DllCall("gdiplus.dll\GdipNewInstalledFontCollection", "ptr", fontCollection, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontCollection>} fontCollection 
     * @returns {Integer} 
     */
    static GdipNewPrivateFontCollection(fontCollection) {
        result := DllCall("gdiplus.dll\GdipNewPrivateFontCollection", "ptr", fontCollection, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontCollection>} fontCollection 
     * @returns {Integer} 
     */
    static GdipDeletePrivateFontCollection(fontCollection) {
        result := DllCall("gdiplus.dll\GdipDeletePrivateFontCollection", "ptr", fontCollection, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontCollection>} fontCollection 
     * @param {Pointer<Int32>} numFound 
     * @returns {Integer} 
     */
    static GdipGetFontCollectionFamilyCount(fontCollection, numFound) {
        result := DllCall("gdiplus.dll\GdipGetFontCollectionFamilyCount", "ptr", fontCollection, "int*", numFound, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontCollection>} fontCollection 
     * @param {Integer} numSought 
     * @param {Pointer<GpFontFamily>} gpfamilies 
     * @param {Pointer<Int32>} numFound 
     * @returns {Integer} 
     */
    static GdipGetFontCollectionFamilyList(fontCollection, numSought, gpfamilies, numFound) {
        result := DllCall("gdiplus.dll\GdipGetFontCollectionFamilyList", "ptr", fontCollection, "int", numSought, "ptr", gpfamilies, "int*", numFound, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontCollection>} fontCollection 
     * @param {PWSTR} filename 
     * @returns {Integer} 
     */
    static GdipPrivateAddFontFile(fontCollection, filename) {
        filename := filename is String ? StrPtr(filename) : filename

        result := DllCall("gdiplus.dll\GdipPrivateAddFontFile", "ptr", fontCollection, "ptr", filename, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontCollection>} fontCollection 
     * @param {Pointer<Void>} memory 
     * @param {Integer} length 
     * @returns {Integer} 
     */
    static GdipPrivateAddMemoryFont(fontCollection, memory, length) {
        result := DllCall("gdiplus.dll\GdipPrivateAddMemoryFont", "ptr", fontCollection, "ptr", memory, "int", length, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {PWSTR} string 
     * @param {Integer} length 
     * @param {Pointer<GpFont>} font 
     * @param {Pointer<RectF>} layoutRect 
     * @param {Pointer<GpStringFormat>} stringFormat 
     * @param {Pointer<GpBrush>} brush 
     * @returns {Integer} 
     */
    static GdipDrawString(graphics, string, length, font, layoutRect, stringFormat, brush) {
        string := string is String ? StrPtr(string) : string

        result := DllCall("gdiplus.dll\GdipDrawString", "ptr", graphics, "ptr", string, "int", length, "ptr", font, "ptr", layoutRect, "ptr", stringFormat, "ptr", brush, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {PWSTR} string 
     * @param {Integer} length 
     * @param {Pointer<GpFont>} font 
     * @param {Pointer<RectF>} layoutRect 
     * @param {Pointer<GpStringFormat>} stringFormat 
     * @param {Pointer<RectF>} boundingBox 
     * @param {Pointer<Int32>} codepointsFitted 
     * @param {Pointer<Int32>} linesFilled 
     * @returns {Integer} 
     */
    static GdipMeasureString(graphics, string, length, font, layoutRect, stringFormat, boundingBox, codepointsFitted, linesFilled) {
        string := string is String ? StrPtr(string) : string

        result := DllCall("gdiplus.dll\GdipMeasureString", "ptr", graphics, "ptr", string, "int", length, "ptr", font, "ptr", layoutRect, "ptr", stringFormat, "ptr", boundingBox, "int*", codepointsFitted, "int*", linesFilled, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {PWSTR} string 
     * @param {Integer} length 
     * @param {Pointer<GpFont>} font 
     * @param {Pointer<RectF>} layoutRect 
     * @param {Pointer<GpStringFormat>} stringFormat 
     * @param {Integer} regionCount 
     * @param {Pointer<GpRegion>} regions 
     * @returns {Integer} 
     */
    static GdipMeasureCharacterRanges(graphics, string, length, font, layoutRect, stringFormat, regionCount, regions) {
        string := string is String ? StrPtr(string) : string

        result := DllCall("gdiplus.dll\GdipMeasureCharacterRanges", "ptr", graphics, "ptr", string, "int", length, "ptr", font, "ptr", layoutRect, "ptr", stringFormat, "int", regionCount, "ptr", regions, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<UInt16>} text 
     * @param {Integer} length 
     * @param {Pointer<GpFont>} font 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<PointF>} positions 
     * @param {Integer} flags 
     * @param {Pointer<Matrix>} matrix 
     * @returns {Integer} 
     */
    static GdipDrawDriverString(graphics, text, length, font, brush, positions, flags, matrix) {
        result := DllCall("gdiplus.dll\GdipDrawDriverString", "ptr", graphics, "ushort*", text, "int", length, "ptr", font, "ptr", brush, "ptr", positions, "int", flags, "ptr", matrix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<UInt16>} text 
     * @param {Integer} length 
     * @param {Pointer<GpFont>} font 
     * @param {Pointer<PointF>} positions 
     * @param {Integer} flags 
     * @param {Pointer<Matrix>} matrix 
     * @param {Pointer<RectF>} boundingBox 
     * @returns {Integer} 
     */
    static GdipMeasureDriverString(graphics, text, length, font, positions, flags, matrix, boundingBox) {
        result := DllCall("gdiplus.dll\GdipMeasureDriverString", "ptr", graphics, "ushort*", text, "int", length, "ptr", font, "ptr", positions, "int", flags, "ptr", matrix, "ptr", boundingBox, "int")
        return result
    }

    /**
     * 
     * @param {Integer} formatAttributes 
     * @param {Integer} language 
     * @param {Pointer<GpStringFormat>} format 
     * @returns {Integer} 
     */
    static GdipCreateStringFormat(formatAttributes, language, format) {
        result := DllCall("gdiplus.dll\GdipCreateStringFormat", "int", formatAttributes, "ushort", language, "ptr", format, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @returns {Integer} 
     */
    static GdipStringFormatGetGenericDefault(format) {
        result := DllCall("gdiplus.dll\GdipStringFormatGetGenericDefault", "ptr", format, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @returns {Integer} 
     */
    static GdipStringFormatGetGenericTypographic(format) {
        result := DllCall("gdiplus.dll\GdipStringFormatGetGenericTypographic", "ptr", format, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @returns {Integer} 
     */
    static GdipDeleteStringFormat(format) {
        result := DllCall("gdiplus.dll\GdipDeleteStringFormat", "ptr", format, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Pointer<GpStringFormat>} newFormat 
     * @returns {Integer} 
     */
    static GdipCloneStringFormat(format, newFormat) {
        result := DllCall("gdiplus.dll\GdipCloneStringFormat", "ptr", format, "ptr", newFormat, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Integer} flags 
     * @returns {Integer} 
     */
    static GdipSetStringFormatFlags(format, flags) {
        result := DllCall("gdiplus.dll\GdipSetStringFormatFlags", "ptr", format, "int", flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Pointer<Int32>} flags 
     * @returns {Integer} 
     */
    static GdipGetStringFormatFlags(format, flags) {
        result := DllCall("gdiplus.dll\GdipGetStringFormatFlags", "ptr", format, "int*", flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Integer} align 
     * @returns {Integer} 
     */
    static GdipSetStringFormatAlign(format, align) {
        result := DllCall("gdiplus.dll\GdipSetStringFormatAlign", "ptr", format, "int", align, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Pointer<Int32>} align 
     * @returns {Integer} 
     */
    static GdipGetStringFormatAlign(format, align) {
        result := DllCall("gdiplus.dll\GdipGetStringFormatAlign", "ptr", format, "int*", align, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Integer} align 
     * @returns {Integer} 
     */
    static GdipSetStringFormatLineAlign(format, align) {
        result := DllCall("gdiplus.dll\GdipSetStringFormatLineAlign", "ptr", format, "int", align, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Pointer<Int32>} align 
     * @returns {Integer} 
     */
    static GdipGetStringFormatLineAlign(format, align) {
        result := DllCall("gdiplus.dll\GdipGetStringFormatLineAlign", "ptr", format, "int*", align, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Integer} trimming 
     * @returns {Integer} 
     */
    static GdipSetStringFormatTrimming(format, trimming) {
        result := DllCall("gdiplus.dll\GdipSetStringFormatTrimming", "ptr", format, "int", trimming, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Pointer<Int32>} trimming 
     * @returns {Integer} 
     */
    static GdipGetStringFormatTrimming(format, trimming) {
        result := DllCall("gdiplus.dll\GdipGetStringFormatTrimming", "ptr", format, "int*", trimming, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Integer} hotkeyPrefix 
     * @returns {Integer} 
     */
    static GdipSetStringFormatHotkeyPrefix(format, hotkeyPrefix) {
        result := DllCall("gdiplus.dll\GdipSetStringFormatHotkeyPrefix", "ptr", format, "int", hotkeyPrefix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Pointer<Int32>} hotkeyPrefix 
     * @returns {Integer} 
     */
    static GdipGetStringFormatHotkeyPrefix(format, hotkeyPrefix) {
        result := DllCall("gdiplus.dll\GdipGetStringFormatHotkeyPrefix", "ptr", format, "int*", hotkeyPrefix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Float} firstTabOffset 
     * @param {Integer} count 
     * @param {Pointer<Single>} tabStops 
     * @returns {Integer} 
     */
    static GdipSetStringFormatTabStops(format, firstTabOffset, count, tabStops) {
        result := DllCall("gdiplus.dll\GdipSetStringFormatTabStops", "ptr", format, "float", firstTabOffset, "int", count, "float*", tabStops, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Integer} count 
     * @param {Pointer<Single>} firstTabOffset 
     * @param {Pointer<Single>} tabStops 
     * @returns {Integer} 
     */
    static GdipGetStringFormatTabStops(format, count, firstTabOffset, tabStops) {
        result := DllCall("gdiplus.dll\GdipGetStringFormatTabStops", "ptr", format, "int", count, "float*", firstTabOffset, "float*", tabStops, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Pointer<Int32>} count 
     * @returns {Integer} 
     */
    static GdipGetStringFormatTabStopCount(format, count) {
        result := DllCall("gdiplus.dll\GdipGetStringFormatTabStopCount", "ptr", format, "int*", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Integer} language 
     * @param {Integer} substitute 
     * @returns {Integer} 
     */
    static GdipSetStringFormatDigitSubstitution(format, language, substitute) {
        result := DllCall("gdiplus.dll\GdipSetStringFormatDigitSubstitution", "ptr", format, "ushort", language, "int", substitute, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Pointer<UInt16>} language 
     * @param {Pointer<Int32>} substitute 
     * @returns {Integer} 
     */
    static GdipGetStringFormatDigitSubstitution(format, language, substitute) {
        result := DllCall("gdiplus.dll\GdipGetStringFormatDigitSubstitution", "ptr", format, "ushort*", language, "int*", substitute, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Pointer<Int32>} count 
     * @returns {Integer} 
     */
    static GdipGetStringFormatMeasurableCharacterRangeCount(format, count) {
        result := DllCall("gdiplus.dll\GdipGetStringFormatMeasurableCharacterRangeCount", "ptr", format, "int*", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Integer} rangeCount 
     * @param {Pointer<CharacterRange>} ranges 
     * @returns {Integer} 
     */
    static GdipSetStringFormatMeasurableCharacterRanges(format, rangeCount, ranges) {
        result := DllCall("gdiplus.dll\GdipSetStringFormatMeasurableCharacterRanges", "ptr", format, "int", rangeCount, "ptr", ranges, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBitmap>} bitmap 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpCachedBitmap>} cachedBitmap 
     * @returns {Integer} 
     */
    static GdipCreateCachedBitmap(bitmap, graphics, cachedBitmap) {
        result := DllCall("gdiplus.dll\GdipCreateCachedBitmap", "ptr", bitmap, "ptr", graphics, "ptr", cachedBitmap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpCachedBitmap>} cachedBitmap 
     * @returns {Integer} 
     */
    static GdipDeleteCachedBitmap(cachedBitmap) {
        result := DllCall("gdiplus.dll\GdipDeleteCachedBitmap", "ptr", cachedBitmap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpCachedBitmap>} cachedBitmap 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {Integer} 
     */
    static GdipDrawCachedBitmap(graphics, cachedBitmap, x, y) {
        result := DllCall("gdiplus.dll\GdipDrawCachedBitmap", "ptr", graphics, "ptr", cachedBitmap, "int", x, "int", y, "int")
        return result
    }

    /**
     * 
     * @param {HENHMETAFILE} hemf 
     * @param {Integer} cbData16 
     * @param {Pointer<Byte>} pData16 
     * @param {Integer} iMapMode 
     * @param {Integer} eFlags 
     * @returns {Integer} 
     */
    static GdipEmfToWmfBits(hemf, cbData16, pData16, iMapMode, eFlags) {
        hemf := hemf is Win32Handle ? NumGet(hemf, "ptr") : hemf

        result := DllCall("gdiplus.dll\GdipEmfToWmfBits", "ptr", hemf, "uint", cbData16, "char*", pData16, "int", iMapMode, "int", eFlags, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImageAttributes>} imageattr 
     * @param {BOOL} enableFlag 
     * @returns {Integer} 
     */
    static GdipSetImageAttributesCachedBackground(imageattr, enableFlag) {
        result := DllCall("gdiplus.dll\GdipSetImageAttributesCachedBackground", "ptr", imageattr, "int", enableFlag, "int")
        return result
    }

    /**
     * 
     * @param {Integer} control 
     * @param {Pointer<Void>} param1 
     * @returns {Integer} 
     */
    static GdipTestControl(control, param1) {
        result := DllCall("gdiplus.dll\GdipTestControl", "int", control, "ptr", param1, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UIntPtr>} token 
     * @returns {Integer} 
     */
    static GdiplusNotificationHook(token) {
        result := DllCall("gdiplus.dll\GdiplusNotificationHook", "ptr*", token, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} token 
     * @returns {String} Nothing - always returns an empty string
     */
    static GdiplusNotificationUnhook(token) {
        DllCall("gdiplus.dll\GdiplusNotificationUnhook", "ptr", token)
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} refGraphics 
     * @param {Pointer<GpMetafile>} metafile 
     * @param {Pointer<Int32>} conversionFailureFlag 
     * @param {Integer} emfType 
     * @param {PWSTR} description 
     * @param {Pointer<GpMetafile>} out_metafile 
     * @returns {Integer} 
     */
    static GdipConvertToEmfPlus(refGraphics, metafile, conversionFailureFlag, emfType, description, out_metafile) {
        description := description is String ? StrPtr(description) : description

        result := DllCall("gdiplus.dll\GdipConvertToEmfPlus", "ptr", refGraphics, "ptr", metafile, "int*", conversionFailureFlag, "int", emfType, "ptr", description, "ptr", out_metafile, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} refGraphics 
     * @param {Pointer<GpMetafile>} metafile 
     * @param {Pointer<Int32>} conversionFailureFlag 
     * @param {PWSTR} filename 
     * @param {Integer} emfType 
     * @param {PWSTR} description 
     * @param {Pointer<GpMetafile>} out_metafile 
     * @returns {Integer} 
     */
    static GdipConvertToEmfPlusToFile(refGraphics, metafile, conversionFailureFlag, filename, emfType, description, out_metafile) {
        filename := filename is String ? StrPtr(filename) : filename
        description := description is String ? StrPtr(description) : description

        result := DllCall("gdiplus.dll\GdipConvertToEmfPlusToFile", "ptr", refGraphics, "ptr", metafile, "int*", conversionFailureFlag, "ptr", filename, "int", emfType, "ptr", description, "ptr", out_metafile, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} refGraphics 
     * @param {Pointer<GpMetafile>} metafile 
     * @param {Pointer<Int32>} conversionFailureFlag 
     * @param {Pointer<IStream>} stream 
     * @param {Integer} emfType 
     * @param {PWSTR} description 
     * @param {Pointer<GpMetafile>} out_metafile 
     * @returns {Integer} 
     */
    static GdipConvertToEmfPlusToStream(refGraphics, metafile, conversionFailureFlag, stream, emfType, description, out_metafile) {
        description := description is String ? StrPtr(description) : description

        result := DllCall("gdiplus.dll\GdipConvertToEmfPlusToStream", "ptr", refGraphics, "ptr", metafile, "int*", conversionFailureFlag, "ptr", stream, "int", emfType, "ptr", description, "ptr", out_metafile, "int")
        return result
    }

;@endregion Methods
}
