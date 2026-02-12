#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @type {Guid}
     */
    static ImageFormatUndefined => Guid("{b96b3ca9-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static ImageFormatMemoryBMP => Guid("{b96b3caa-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static ImageFormatBMP => Guid("{b96b3cab-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static ImageFormatEMF => Guid("{b96b3cac-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static ImageFormatWMF => Guid("{b96b3cad-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static ImageFormatJPEG => Guid("{b96b3cae-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static ImageFormatPNG => Guid("{b96b3caf-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static ImageFormatGIF => Guid("{b96b3cb0-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static ImageFormatTIFF => Guid("{b96b3cb1-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static ImageFormatEXIF => Guid("{b96b3cb2-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static ImageFormatIcon => Guid("{b96b3cb5-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static ImageFormatHEIF => Guid("{b96b3cb6-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static ImageFormatWEBP => Guid("{b96b3cb7-0728-11d3-9d7b-0000f81ef32e}")

    /**
     * @type {Guid}
     */
    static FrameDimensionTime => Guid("{6aedbd6d-3fb5-418a-83a6-7f45229dc872}")

    /**
     * @type {Guid}
     */
    static FrameDimensionResolution => Guid("{84236f7b-3bd3-428f-8dab-4ea1439ca315}")

    /**
     * @type {Guid}
     */
    static FrameDimensionPage => Guid("{7462dc86-6180-4c7e-8e3f-ee7333a7a483}")

    /**
     * @type {Guid}
     */
    static FormatIDImageInformation => Guid("{e5836cbe-5eef-4f1d-acde-ae4c43b608ce}")

    /**
     * @type {Guid}
     */
    static FormatIDJpegAppHeaders => Guid("{1c4afdcd-6177-43cf-abc7-5f51af39ee85}")

    /**
     * @type {Guid}
     */
    static EncoderCompression => Guid("{e09d739d-ccd4-44ee-8eba-3fbf8be4fc58}")

    /**
     * @type {Guid}
     */
    static EncoderColorDepth => Guid("{66087055-ad66-4c7c-9a18-38a2310b8337}")

    /**
     * @type {Guid}
     */
    static EncoderScanMethod => Guid("{3a4e2661-3109-4e56-8536-42c156e7dcfa}")

    /**
     * @type {Guid}
     */
    static EncoderVersion => Guid("{24d18c76-814a-41a4-bf53-1c219cccf797}")

    /**
     * @type {Guid}
     */
    static EncoderRenderMethod => Guid("{6d42c53a-229a-4825-8bb7-5c99e2b9a8b8}")

    /**
     * @type {Guid}
     */
    static EncoderQuality => Guid("{1d5be4b5-fa4a-452d-9cdd-5db35105e7eb}")

    /**
     * @type {Guid}
     */
    static EncoderTransformation => Guid("{8d0eb2d1-a58e-4ea8-aa14-108074b7b6f9}")

    /**
     * @type {Guid}
     */
    static EncoderLuminanceTable => Guid("{edb33bce-0266-4a77-b904-27216099e717}")

    /**
     * @type {Guid}
     */
    static EncoderChrominanceTable => Guid("{f2e455dc-09b3-4316-8260-676ada32481c}")

    /**
     * @type {Guid}
     */
    static EncoderSaveFlag => Guid("{292266fc-ac40-47bf-8cfc-a85b89a655de}")

    /**
     * @type {Guid}
     */
    static EncoderColorSpace => Guid("{ae7a62a0-ee2c-49d8-9d07-1ba8a927596e}")

    /**
     * @type {Guid}
     */
    static EncoderImageItems => Guid("{63875e13-1f1d-45ab-9195-a29b6066a650}")

    /**
     * @type {Guid}
     */
    static EncoderSaveAsCMYK => Guid("{a219bbc9-0a9d-4005-a3ee-3a421b8bb06c}")

    /**
     * @type {Guid}
     */
    static CodecIImageBytes => Guid("{025d1823-6c7d-447b-bbdb-a3cbc3dfa2fc}")

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
     * @type {Float}
     */
    static FlatnessDefault => 0.25

    /**
     * @type {Guid}
     */
    static BlurEffectGuid => Guid("{633c80a4-1843-482b-9ef2-be2834c5fdd4}")

    /**
     * @type {Guid}
     */
    static SharpenEffectGuid => Guid("{63cbf3ee-c526-402c-8f71-62c540bf5142}")

    /**
     * @type {Guid}
     */
    static ColorMatrixEffectGuid => Guid("{718f2615-7933-40e3-a511-5f68fe14dd74}")

    /**
     * @type {Guid}
     */
    static ColorLUTEffectGuid => Guid("{a7ce72a9-0f7f-40d7-b3cc-d0c02d5c3212}")

    /**
     * @type {Guid}
     */
    static BrightnessContrastEffectGuid => Guid("{d3a1dbe1-8ec4-4c17-9f4c-ea97ad1c343d}")

    /**
     * @type {Guid}
     */
    static HueSaturationLightnessEffectGuid => Guid("{8b2dd6c3-eb07-4d87-a5f0-7108e26a9c5f}")

    /**
     * @type {Guid}
     */
    static LevelsEffectGuid => Guid("{99c354ec-2a31-4f3a-8c34-17a803b33a25}")

    /**
     * @type {Guid}
     */
    static TintEffectGuid => Guid("{1077af00-2848-4441-9489-44ad4c2d7a2c}")

    /**
     * @type {Guid}
     */
    static ColorBalanceEffectGuid => Guid("{537e597d-251e-48da-9664-29ca496b70f8}")

    /**
     * @type {Guid}
     */
    static RedEyeCorrectionEffectGuid => Guid("{74d29d05-69a4-4266-9549-3cc52836b632}")

    /**
     * @type {Guid}
     */
    static ColorCurveEffectGuid => Guid("{dd6a0022-58e4-4a67-9d9b-d48eb881a53d}")
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer} size_ 
     * @returns {Pointer<Void>} 
     */
    static GdipAlloc(size_) {
        result := DllCall("gdiplus.dll\GdipAlloc", "ptr", size_, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} ptr 
     * @returns {String} Nothing - always returns an empty string
     */
    static GdipFree(ptr) {
        ptrMarshal := ptr is VarRef ? "ptr" : "ptr"

        DllCall("gdiplus.dll\GdipFree", ptrMarshal, ptr)
    }

    /**
     * 
     * @param {Pointer<Pointer>} token 
     * @param {Pointer<GdiplusStartupInput>} input_ 
     * @param {Pointer<GdiplusStartupOutput>} output 
     * @returns {Integer} 
     * @since windows5.1.2600
     */
    static GdiplusStartup(token, input_, output) {
        tokenMarshal := token is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdiplusStartup", tokenMarshal, token, "ptr", input_, "ptr", output, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} token 
     * @returns {String} Nothing - always returns an empty string
     * @since windows5.1.2600
     */
    static GdiplusShutdown(token) {
        DllCall("gdiplus.dll\GdiplusShutdown", "ptr", token)
    }

    /**
     * 
     * @param {Guid} guid 
     * @param {Pointer<Pointer<CGpEffect>>} effect_ 
     * @returns {Integer} 
     */
    static GdipCreateEffect(guid, effect_) {
        effect_Marshal := effect_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateEffect", "ptr", guid, effect_Marshal, effect_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<CGpEffect>} effect_ 
     * @returns {Integer} 
     */
    static GdipDeleteEffect(effect_) {
        result := DllCall("gdiplus.dll\GdipDeleteEffect", "ptr", effect_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<CGpEffect>} effect_ 
     * @param {Pointer<Integer>} size_ 
     * @returns {Integer} 
     */
    static GdipGetEffectParameterSize(effect_, size_) {
        size_Marshal := size_ is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetEffectParameterSize", "ptr", effect_, size_Marshal, size_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<CGpEffect>} effect_ 
     * @param {Pointer<Void>} params 
     * @param {Integer} size_ 
     * @returns {Integer} 
     */
    static GdipSetEffectParameters(effect_, params, size_) {
        paramsMarshal := params is VarRef ? "ptr" : "ptr"

        result := DllCall("gdiplus.dll\GdipSetEffectParameters", "ptr", effect_, paramsMarshal, params, "uint", size_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<CGpEffect>} effect_ 
     * @param {Pointer<Integer>} size_ 
     * @param {Pointer<Void>} params 
     * @returns {Integer} 
     */
    static GdipGetEffectParameters(effect_, size_, params) {
        size_Marshal := size_ is VarRef ? "uint*" : "ptr"
        paramsMarshal := params is VarRef ? "ptr" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetEffectParameters", "ptr", effect_, size_Marshal, size_, paramsMarshal, params, "int")
        return result
    }

    /**
     * 
     * @param {Integer} brushMode 
     * @param {Pointer<Pointer<GpPath>>} path_ 
     * @returns {Integer} 
     */
    static GdipCreatePath(brushMode, path_) {
        path_Marshal := path_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreatePath", "int", brushMode, path_Marshal, path_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PointF>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Pointer<Pointer<GpPath>>} path_ 
     * @returns {Integer} 
     */
    static GdipCreatePath2(param0, param1, param2, param3, path_) {
        param1Marshal := param1 is VarRef ? "char*" : "ptr"
        path_Marshal := path_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreatePath2", "ptr", param0, param1Marshal, param1, "int", param2, "int", param3, path_Marshal, path_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Point>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Pointer<Pointer<GpPath>>} path_ 
     * @returns {Integer} 
     */
    static GdipCreatePath2I(param0, param1, param2, param3, path_) {
        param1Marshal := param1 is VarRef ? "char*" : "ptr"
        path_Marshal := path_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreatePath2I", "ptr", param0, param1Marshal, param1, "int", param2, "int", param3, path_Marshal, path_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<Pointer<GpPath>>} clonePath 
     * @returns {Integer} 
     */
    static GdipClonePath(path_, clonePath) {
        clonePathMarshal := clonePath is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipClonePath", "ptr", path_, clonePathMarshal, clonePath, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @returns {Integer} 
     */
    static GdipDeletePath(path_) {
        result := DllCall("gdiplus.dll\GdipDeletePath", "ptr", path_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @returns {Integer} 
     */
    static GdipResetPath(path_) {
        result := DllCall("gdiplus.dll\GdipResetPath", "ptr", path_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<Integer>} count 
     * @returns {Integer} 
     */
    static GdipGetPointCount(path_, count) {
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPointCount", "ptr", path_, countMarshal, count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer} types 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipGetPathTypes(path_, types, count) {
        result := DllCall("gdiplus.dll\GdipGetPathTypes", "ptr", path_, "ptr", types, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} param0 
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipGetPathPoints(param0, points_, count) {
        result := DllCall("gdiplus.dll\GdipGetPathPoints", "ptr", param0, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} param0 
     * @param {Pointer<Point>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipGetPathPointsI(param0, points_, count) {
        result := DllCall("gdiplus.dll\GdipGetPathPointsI", "ptr", param0, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<Integer>} fillmode_ 
     * @returns {Integer} 
     */
    static GdipGetPathFillMode(path_, fillmode_) {
        fillmode_Marshal := fillmode_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPathFillMode", "ptr", path_, fillmode_Marshal, fillmode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Integer} fillmode_ 
     * @returns {Integer} 
     */
    static GdipSetPathFillMode(path_, fillmode_) {
        result := DllCall("gdiplus.dll\GdipSetPathFillMode", "ptr", path_, "int", fillmode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<PathData>} pathData_ 
     * @returns {Integer} 
     */
    static GdipGetPathData(path_, pathData_) {
        result := DllCall("gdiplus.dll\GdipGetPathData", "ptr", path_, "ptr", pathData_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @returns {Integer} 
     */
    static GdipStartPathFigure(path_) {
        result := DllCall("gdiplus.dll\GdipStartPathFigure", "ptr", path_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @returns {Integer} 
     */
    static GdipClosePathFigure(path_) {
        result := DllCall("gdiplus.dll\GdipClosePathFigure", "ptr", path_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @returns {Integer} 
     */
    static GdipClosePathFigures(path_) {
        result := DllCall("gdiplus.dll\GdipClosePathFigures", "ptr", path_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @returns {Integer} 
     */
    static GdipSetPathMarker(path_) {
        result := DllCall("gdiplus.dll\GdipSetPathMarker", "ptr", path_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @returns {Integer} 
     */
    static GdipClearPathMarkers(path_) {
        result := DllCall("gdiplus.dll\GdipClearPathMarkers", "ptr", path_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @returns {Integer} 
     */
    static GdipReversePath(path_) {
        result := DllCall("gdiplus.dll\GdipReversePath", "ptr", path_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<PointF>} lastPoint 
     * @returns {Integer} 
     */
    static GdipGetPathLastPoint(path_, lastPoint) {
        result := DllCall("gdiplus.dll\GdipGetPathLastPoint", "ptr", path_, "ptr", lastPoint, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Float} x1 
     * @param {Float} y1 
     * @param {Float} x2 
     * @param {Float} y2 
     * @returns {Integer} 
     */
    static GdipAddPathLine(path_, x1, y1, x2, y2) {
        result := DllCall("gdiplus.dll\GdipAddPathLine", "ptr", path_, "float", x1, "float", y1, "float", x2, "float", y2, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathLine2(path_, points_, count) {
        result := DllCall("gdiplus.dll\GdipAddPathLine2", "ptr", path_, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @param {Float} startAngle 
     * @param {Float} sweepAngle 
     * @returns {Integer} 
     */
    static GdipAddPathArc(path_, x, y, width, height, startAngle, sweepAngle) {
        result := DllCall("gdiplus.dll\GdipAddPathArc", "ptr", path_, "float", x, "float", y, "float", width, "float", height, "float", startAngle, "float", sweepAngle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
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
    static GdipAddPathBezier(path_, x1, y1, x2, y2, x3, y3, x4, y4) {
        result := DllCall("gdiplus.dll\GdipAddPathBezier", "ptr", path_, "float", x1, "float", y1, "float", x2, "float", y2, "float", x3, "float", y3, "float", x4, "float", y4, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathBeziers(path_, points_, count) {
        result := DllCall("gdiplus.dll\GdipAddPathBeziers", "ptr", path_, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathCurve(path_, points_, count) {
        result := DllCall("gdiplus.dll\GdipAddPathCurve", "ptr", path_, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipAddPathCurve2(path_, points_, count, tension) {
        result := DllCall("gdiplus.dll\GdipAddPathCurve2", "ptr", path_, "ptr", points_, "int", count, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @param {Integer} offset 
     * @param {Integer} numberOfSegments 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipAddPathCurve3(path_, points_, count, offset, numberOfSegments, tension) {
        result := DllCall("gdiplus.dll\GdipAddPathCurve3", "ptr", path_, "ptr", points_, "int", count, "int", offset, "int", numberOfSegments, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathClosedCurve(path_, points_, count) {
        result := DllCall("gdiplus.dll\GdipAddPathClosedCurve", "ptr", path_, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipAddPathClosedCurve2(path_, points_, count, tension) {
        result := DllCall("gdiplus.dll\GdipAddPathClosedCurve2", "ptr", path_, "ptr", points_, "int", count, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @returns {Integer} 
     */
    static GdipAddPathRectangle(path_, x, y, width, height) {
        result := DllCall("gdiplus.dll\GdipAddPathRectangle", "ptr", path_, "float", x, "float", y, "float", width, "float", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<RectF>} rects 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathRectangles(path_, rects, count) {
        result := DllCall("gdiplus.dll\GdipAddPathRectangles", "ptr", path_, "ptr", rects, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @returns {Integer} 
     */
    static GdipAddPathEllipse(path_, x, y, width, height) {
        result := DllCall("gdiplus.dll\GdipAddPathEllipse", "ptr", path_, "float", x, "float", y, "float", width, "float", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @param {Float} startAngle 
     * @param {Float} sweepAngle 
     * @returns {Integer} 
     */
    static GdipAddPathPie(path_, x, y, width, height, startAngle, sweepAngle) {
        result := DllCall("gdiplus.dll\GdipAddPathPie", "ptr", path_, "float", x, "float", y, "float", width, "float", height, "float", startAngle, "float", sweepAngle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathPolygon(path_, points_, count) {
        result := DllCall("gdiplus.dll\GdipAddPathPolygon", "ptr", path_, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<GpPath>} addingPath 
     * @param {BOOL} connect 
     * @returns {Integer} 
     */
    static GdipAddPathPath(path_, addingPath, connect) {
        result := DllCall("gdiplus.dll\GdipAddPathPath", "ptr", path_, "ptr", addingPath, "int", connect, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {PWSTR} string_ 
     * @param {Integer} length 
     * @param {Pointer<GpFontFamily>} family 
     * @param {Integer} style 
     * @param {Float} emSize 
     * @param {Pointer<RectF>} layoutRect 
     * @param {Pointer<GpStringFormat>} format 
     * @returns {Integer} 
     */
    static GdipAddPathString(path_, string_, length, family, style, emSize, layoutRect, format) {
        string_ := string_ is String ? StrPtr(string_) : string_

        result := DllCall("gdiplus.dll\GdipAddPathString", "ptr", path_, "ptr", string_, "int", length, "ptr", family, "int", style, "float", emSize, "ptr", layoutRect, "ptr", format, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {PWSTR} string_ 
     * @param {Integer} length 
     * @param {Pointer<GpFontFamily>} family 
     * @param {Integer} style 
     * @param {Float} emSize 
     * @param {Pointer<Rect>} layoutRect 
     * @param {Pointer<GpStringFormat>} format 
     * @returns {Integer} 
     */
    static GdipAddPathStringI(path_, string_, length, family, style, emSize, layoutRect, format) {
        string_ := string_ is String ? StrPtr(string_) : string_

        result := DllCall("gdiplus.dll\GdipAddPathStringI", "ptr", path_, "ptr", string_, "int", length, "ptr", family, "int", style, "float", emSize, "ptr", layoutRect, "ptr", format, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Integer} x1 
     * @param {Integer} y1 
     * @param {Integer} x2 
     * @param {Integer} y2 
     * @returns {Integer} 
     */
    static GdipAddPathLineI(path_, x1, y1, x2, y2) {
        result := DllCall("gdiplus.dll\GdipAddPathLineI", "ptr", path_, "int", x1, "int", y1, "int", x2, "int", y2, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<Point>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathLine2I(path_, points_, count) {
        result := DllCall("gdiplus.dll\GdipAddPathLine2I", "ptr", path_, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Float} startAngle 
     * @param {Float} sweepAngle 
     * @returns {Integer} 
     */
    static GdipAddPathArcI(path_, x, y, width, height, startAngle, sweepAngle) {
        result := DllCall("gdiplus.dll\GdipAddPathArcI", "ptr", path_, "int", x, "int", y, "int", width, "int", height, "float", startAngle, "float", sweepAngle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
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
    static GdipAddPathBezierI(path_, x1, y1, x2, y2, x3, y3, x4, y4) {
        result := DllCall("gdiplus.dll\GdipAddPathBezierI", "ptr", path_, "int", x1, "int", y1, "int", x2, "int", y2, "int", x3, "int", y3, "int", x4, "int", y4, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<Point>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathBeziersI(path_, points_, count) {
        result := DllCall("gdiplus.dll\GdipAddPathBeziersI", "ptr", path_, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<Point>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathCurveI(path_, points_, count) {
        result := DllCall("gdiplus.dll\GdipAddPathCurveI", "ptr", path_, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<Point>} points_ 
     * @param {Integer} count 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipAddPathCurve2I(path_, points_, count, tension) {
        result := DllCall("gdiplus.dll\GdipAddPathCurve2I", "ptr", path_, "ptr", points_, "int", count, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<Point>} points_ 
     * @param {Integer} count 
     * @param {Integer} offset 
     * @param {Integer} numberOfSegments 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipAddPathCurve3I(path_, points_, count, offset, numberOfSegments, tension) {
        result := DllCall("gdiplus.dll\GdipAddPathCurve3I", "ptr", path_, "ptr", points_, "int", count, "int", offset, "int", numberOfSegments, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<Point>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathClosedCurveI(path_, points_, count) {
        result := DllCall("gdiplus.dll\GdipAddPathClosedCurveI", "ptr", path_, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<Point>} points_ 
     * @param {Integer} count 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipAddPathClosedCurve2I(path_, points_, count, tension) {
        result := DllCall("gdiplus.dll\GdipAddPathClosedCurve2I", "ptr", path_, "ptr", points_, "int", count, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {Integer} 
     */
    static GdipAddPathRectangleI(path_, x, y, width, height) {
        result := DllCall("gdiplus.dll\GdipAddPathRectangleI", "ptr", path_, "int", x, "int", y, "int", width, "int", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<Rect>} rects 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathRectanglesI(path_, rects, count) {
        result := DllCall("gdiplus.dll\GdipAddPathRectanglesI", "ptr", path_, "ptr", rects, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {Integer} 
     */
    static GdipAddPathEllipseI(path_, x, y, width, height) {
        result := DllCall("gdiplus.dll\GdipAddPathEllipseI", "ptr", path_, "int", x, "int", y, "int", width, "int", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Float} startAngle 
     * @param {Float} sweepAngle 
     * @returns {Integer} 
     */
    static GdipAddPathPieI(path_, x, y, width, height, startAngle, sweepAngle) {
        result := DllCall("gdiplus.dll\GdipAddPathPieI", "ptr", path_, "int", x, "int", y, "int", width, "int", height, "float", startAngle, "float", sweepAngle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<Point>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipAddPathPolygonI(path_, points_, count) {
        result := DllCall("gdiplus.dll\GdipAddPathPolygonI", "ptr", path_, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Float} flatness 
     * @returns {Integer} 
     */
    static GdipFlattenPath(path_, matrix_, flatness) {
        result := DllCall("gdiplus.dll\GdipFlattenPath", "ptr", path_, "ptr", matrix_, "float", flatness, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Float} flatness 
     * @returns {Integer} 
     */
    static GdipWindingModeOutline(path_, matrix_, flatness) {
        result := DllCall("gdiplus.dll\GdipWindingModeOutline", "ptr", path_, "ptr", matrix_, "float", flatness, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} nativePath 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Float} flatness 
     * @returns {Integer} 
     */
    static GdipWidenPath(nativePath, pen, matrix_, flatness) {
        result := DllCall("gdiplus.dll\GdipWidenPath", "ptr", nativePath, "ptr", pen, "ptr", matrix_, "float", flatness, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @param {Float} srcx 
     * @param {Float} srcy 
     * @param {Float} srcwidth 
     * @param {Float} srcheight 
     * @param {Integer} warpMode_ 
     * @param {Float} flatness 
     * @returns {Integer} 
     */
    static GdipWarpPath(path_, matrix_, points_, count, srcx, srcy, srcwidth, srcheight, warpMode_, flatness) {
        result := DllCall("gdiplus.dll\GdipWarpPath", "ptr", path_, "ptr", matrix_, "ptr", points_, "int", count, "float", srcx, "float", srcy, "float", srcwidth, "float", srcheight, "int", warpMode_, "float", flatness, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<Matrix>} matrix_ 
     * @returns {Integer} 
     */
    static GdipTransformPath(path_, matrix_) {
        result := DllCall("gdiplus.dll\GdipTransformPath", "ptr", path_, "ptr", matrix_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<RectF>} bounds 
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Pointer<GpPen>} pen 
     * @returns {Integer} 
     */
    static GdipGetPathWorldBounds(path_, bounds, matrix_, pen) {
        result := DllCall("gdiplus.dll\GdipGetPathWorldBounds", "ptr", path_, "ptr", bounds, "ptr", matrix_, "ptr", pen, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<Rect>} bounds 
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Pointer<GpPen>} pen 
     * @returns {Integer} 
     */
    static GdipGetPathWorldBoundsI(path_, bounds, matrix_, pen) {
        result := DllCall("gdiplus.dll\GdipGetPathWorldBoundsI", "ptr", path_, "ptr", bounds, "ptr", matrix_, "ptr", pen, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result_ 
     * @returns {Integer} 
     */
    static GdipIsVisiblePathPoint(path_, x, y, graphics, result_) {
        result_Marshal := result_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipIsVisiblePathPoint", "ptr", path_, "float", x, "float", y, "ptr", graphics, result_Marshal, result_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result_ 
     * @returns {Integer} 
     */
    static GdipIsVisiblePathPointI(path_, x, y, graphics, result_) {
        result_Marshal := result_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipIsVisiblePathPointI", "ptr", path_, "int", x, "int", y, "ptr", graphics, result_Marshal, result_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result_ 
     * @returns {Integer} 
     */
    static GdipIsOutlineVisiblePathPoint(path_, x, y, pen, graphics, result_) {
        result_Marshal := result_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipIsOutlineVisiblePathPoint", "ptr", path_, "float", x, "float", y, "ptr", pen, "ptr", graphics, result_Marshal, result_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result_ 
     * @returns {Integer} 
     */
    static GdipIsOutlineVisiblePathPointI(path_, x, y, pen, graphics, result_) {
        result_Marshal := result_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipIsOutlineVisiblePathPointI", "ptr", path_, "int", x, "int", y, "ptr", pen, "ptr", graphics, result_Marshal, result_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<GpPathIterator>>} iterator 
     * @param {Pointer<GpPath>} path_ 
     * @returns {Integer} 
     */
    static GdipCreatePathIter(iterator, path_) {
        iteratorMarshal := iterator is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreatePathIter", iteratorMarshal, iterator, "ptr", path_, "int")
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
     * @param {Pointer<Integer>} resultCount 
     * @param {Pointer<Integer>} startIndex 
     * @param {Pointer<Integer>} endIndex 
     * @param {Pointer<BOOL>} isClosed 
     * @returns {Integer} 
     */
    static GdipPathIterNextSubpath(iterator, resultCount, startIndex, endIndex, isClosed) {
        resultCountMarshal := resultCount is VarRef ? "int*" : "ptr"
        startIndexMarshal := startIndex is VarRef ? "int*" : "ptr"
        endIndexMarshal := endIndex is VarRef ? "int*" : "ptr"
        isClosedMarshal := isClosed is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipPathIterNextSubpath", "ptr", iterator, resultCountMarshal, resultCount, startIndexMarshal, startIndex, endIndexMarshal, endIndex, isClosedMarshal, isClosed, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathIterator>} iterator 
     * @param {Pointer<Integer>} resultCount 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<BOOL>} isClosed 
     * @returns {Integer} 
     */
    static GdipPathIterNextSubpathPath(iterator, resultCount, path_, isClosed) {
        resultCountMarshal := resultCount is VarRef ? "int*" : "ptr"
        isClosedMarshal := isClosed is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipPathIterNextSubpathPath", "ptr", iterator, resultCountMarshal, resultCount, "ptr", path_, isClosedMarshal, isClosed, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathIterator>} iterator 
     * @param {Pointer<Integer>} resultCount 
     * @param {Pointer<Integer>} pathType 
     * @param {Pointer<Integer>} startIndex 
     * @param {Pointer<Integer>} endIndex 
     * @returns {Integer} 
     */
    static GdipPathIterNextPathType(iterator, resultCount, pathType, startIndex, endIndex) {
        resultCountMarshal := resultCount is VarRef ? "int*" : "ptr"
        pathTypeMarshal := pathType is VarRef ? "char*" : "ptr"
        startIndexMarshal := startIndex is VarRef ? "int*" : "ptr"
        endIndexMarshal := endIndex is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipPathIterNextPathType", "ptr", iterator, resultCountMarshal, resultCount, pathTypeMarshal, pathType, startIndexMarshal, startIndex, endIndexMarshal, endIndex, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathIterator>} iterator 
     * @param {Pointer<Integer>} resultCount 
     * @param {Pointer<Integer>} startIndex 
     * @param {Pointer<Integer>} endIndex 
     * @returns {Integer} 
     */
    static GdipPathIterNextMarker(iterator, resultCount, startIndex, endIndex) {
        resultCountMarshal := resultCount is VarRef ? "int*" : "ptr"
        startIndexMarshal := startIndex is VarRef ? "int*" : "ptr"
        endIndexMarshal := endIndex is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipPathIterNextMarker", "ptr", iterator, resultCountMarshal, resultCount, startIndexMarshal, startIndex, endIndexMarshal, endIndex, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathIterator>} iterator 
     * @param {Pointer<Integer>} resultCount 
     * @param {Pointer<GpPath>} path_ 
     * @returns {Integer} 
     */
    static GdipPathIterNextMarkerPath(iterator, resultCount, path_) {
        resultCountMarshal := resultCount is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipPathIterNextMarkerPath", "ptr", iterator, resultCountMarshal, resultCount, "ptr", path_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathIterator>} iterator 
     * @param {Pointer<Integer>} count 
     * @returns {Integer} 
     */
    static GdipPathIterGetCount(iterator, count) {
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipPathIterGetCount", "ptr", iterator, countMarshal, count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathIterator>} iterator 
     * @param {Pointer<Integer>} count 
     * @returns {Integer} 
     */
    static GdipPathIterGetSubpathCount(iterator, count) {
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipPathIterGetSubpathCount", "ptr", iterator, countMarshal, count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathIterator>} iterator 
     * @param {Pointer<BOOL>} valid 
     * @returns {Integer} 
     */
    static GdipPathIterIsValid(iterator, valid) {
        validMarshal := valid is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipPathIterIsValid", "ptr", iterator, validMarshal, valid, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathIterator>} iterator 
     * @param {Pointer<BOOL>} hasCurve 
     * @returns {Integer} 
     */
    static GdipPathIterHasCurve(iterator, hasCurve) {
        hasCurveMarshal := hasCurve is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipPathIterHasCurve", "ptr", iterator, hasCurveMarshal, hasCurve, "int")
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
     * @param {Pointer<Integer>} resultCount 
     * @param {Pointer<PointF>} points_ 
     * @param {Pointer<Integer>} types 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipPathIterEnumerate(iterator, resultCount, points_, types, count) {
        resultCountMarshal := resultCount is VarRef ? "int*" : "ptr"
        typesMarshal := types is VarRef ? "char*" : "ptr"

        result := DllCall("gdiplus.dll\GdipPathIterEnumerate", "ptr", iterator, resultCountMarshal, resultCount, "ptr", points_, typesMarshal, types, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathIterator>} iterator 
     * @param {Pointer<Integer>} resultCount 
     * @param {Pointer<PointF>} points_ 
     * @param {Pointer<Integer>} types 
     * @param {Integer} startIndex 
     * @param {Integer} endIndex 
     * @returns {Integer} 
     */
    static GdipPathIterCopyData(iterator, resultCount, points_, types, startIndex, endIndex) {
        resultCountMarshal := resultCount is VarRef ? "int*" : "ptr"
        typesMarshal := types is VarRef ? "char*" : "ptr"

        result := DllCall("gdiplus.dll\GdipPathIterCopyData", "ptr", iterator, resultCountMarshal, resultCount, "ptr", points_, typesMarshal, types, "int", startIndex, "int", endIndex, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Matrix>>} matrix_ 
     * @returns {Integer} 
     */
    static GdipCreateMatrix(matrix_) {
        matrix_Marshal := matrix_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateMatrix", matrix_Marshal, matrix_, "int")
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
     * @param {Pointer<Pointer<Matrix>>} matrix_ 
     * @returns {Integer} 
     */
    static GdipCreateMatrix2(m11, m12, m21, m22, dx, dy, matrix_) {
        matrix_Marshal := matrix_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateMatrix2", "float", m11, "float", m12, "float", m21, "float", m22, "float", dx, "float", dy, matrix_Marshal, matrix_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RectF>} rect_ 
     * @param {Pointer<PointF>} dstplg 
     * @param {Pointer<Pointer<Matrix>>} matrix_ 
     * @returns {Integer} 
     */
    static GdipCreateMatrix3(rect_, dstplg, matrix_) {
        matrix_Marshal := matrix_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateMatrix3", "ptr", rect_, "ptr", dstplg, matrix_Marshal, matrix_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Rect>} rect_ 
     * @param {Pointer<Point>} dstplg 
     * @param {Pointer<Pointer<Matrix>>} matrix_ 
     * @returns {Integer} 
     */
    static GdipCreateMatrix3I(rect_, dstplg, matrix_) {
        matrix_Marshal := matrix_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateMatrix3I", "ptr", rect_, "ptr", dstplg, matrix_Marshal, matrix_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Pointer<Pointer<Matrix>>} cloneMatrix 
     * @returns {Integer} 
     */
    static GdipCloneMatrix(matrix_, cloneMatrix) {
        cloneMatrixMarshal := cloneMatrix is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCloneMatrix", "ptr", matrix_, cloneMatrixMarshal, cloneMatrix, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix_ 
     * @returns {Integer} 
     */
    static GdipDeleteMatrix(matrix_) {
        result := DllCall("gdiplus.dll\GdipDeleteMatrix", "ptr", matrix_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Float} m11 
     * @param {Float} m12 
     * @param {Float} m21 
     * @param {Float} m22 
     * @param {Float} dx 
     * @param {Float} dy 
     * @returns {Integer} 
     */
    static GdipSetMatrixElements(matrix_, m11, m12, m21, m22, dx, dy) {
        result := DllCall("gdiplus.dll\GdipSetMatrixElements", "ptr", matrix_, "float", m11, "float", m12, "float", m21, "float", m22, "float", dx, "float", dy, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Pointer<Matrix>} matrix2 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipMultiplyMatrix(matrix_, matrix2, order) {
        result := DllCall("gdiplus.dll\GdipMultiplyMatrix", "ptr", matrix_, "ptr", matrix2, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Float} offsetX 
     * @param {Float} offsetY 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipTranslateMatrix(matrix_, offsetX, offsetY, order) {
        result := DllCall("gdiplus.dll\GdipTranslateMatrix", "ptr", matrix_, "float", offsetX, "float", offsetY, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Float} scaleX 
     * @param {Float} scaleY 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipScaleMatrix(matrix_, scaleX, scaleY, order) {
        result := DllCall("gdiplus.dll\GdipScaleMatrix", "ptr", matrix_, "float", scaleX, "float", scaleY, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Float} angle 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipRotateMatrix(matrix_, angle, order) {
        result := DllCall("gdiplus.dll\GdipRotateMatrix", "ptr", matrix_, "float", angle, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Float} shearX 
     * @param {Float} shearY 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipShearMatrix(matrix_, shearX, shearY, order) {
        result := DllCall("gdiplus.dll\GdipShearMatrix", "ptr", matrix_, "float", shearX, "float", shearY, "int", order, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix_ 
     * @returns {Integer} 
     */
    static GdipInvertMatrix(matrix_) {
        result := DllCall("gdiplus.dll\GdipInvertMatrix", "ptr", matrix_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Pointer<PointF>} pts 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipTransformMatrixPoints(matrix_, pts, count) {
        result := DllCall("gdiplus.dll\GdipTransformMatrixPoints", "ptr", matrix_, "ptr", pts, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Pointer<Point>} pts 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipTransformMatrixPointsI(matrix_, pts, count) {
        result := DllCall("gdiplus.dll\GdipTransformMatrixPointsI", "ptr", matrix_, "ptr", pts, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Pointer<PointF>} pts 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipVectorTransformMatrixPoints(matrix_, pts, count) {
        result := DllCall("gdiplus.dll\GdipVectorTransformMatrixPoints", "ptr", matrix_, "ptr", pts, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Pointer<Point>} pts 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipVectorTransformMatrixPointsI(matrix_, pts, count) {
        result := DllCall("gdiplus.dll\GdipVectorTransformMatrixPointsI", "ptr", matrix_, "ptr", pts, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Pointer<Float>} matrixOut 
     * @returns {Integer} 
     */
    static GdipGetMatrixElements(matrix_, matrixOut) {
        matrixOutMarshal := matrixOut is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetMatrixElements", "ptr", matrix_, matrixOutMarshal, matrixOut, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Pointer<BOOL>} result_ 
     * @returns {Integer} 
     */
    static GdipIsMatrixInvertible(matrix_, result_) {
        result_Marshal := result_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipIsMatrixInvertible", "ptr", matrix_, result_Marshal, result_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Pointer<BOOL>} result_ 
     * @returns {Integer} 
     */
    static GdipIsMatrixIdentity(matrix_, result_) {
        result_Marshal := result_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipIsMatrixIdentity", "ptr", matrix_, result_Marshal, result_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Pointer<Matrix>} matrix2 
     * @param {Pointer<BOOL>} result_ 
     * @returns {Integer} 
     */
    static GdipIsMatrixEqual(matrix_, matrix2, result_) {
        result_Marshal := result_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipIsMatrixEqual", "ptr", matrix_, "ptr", matrix2, result_Marshal, result_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<GpRegion>>} region_ 
     * @returns {Integer} 
     */
    static GdipCreateRegion(region_) {
        region_Marshal := region_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateRegion", region_Marshal, region_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RectF>} rect_ 
     * @param {Pointer<Pointer<GpRegion>>} region_ 
     * @returns {Integer} 
     */
    static GdipCreateRegionRect(rect_, region_) {
        region_Marshal := region_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateRegionRect", "ptr", rect_, region_Marshal, region_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Rect>} rect_ 
     * @param {Pointer<Pointer<GpRegion>>} region_ 
     * @returns {Integer} 
     */
    static GdipCreateRegionRectI(rect_, region_) {
        region_Marshal := region_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateRegionRectI", "ptr", rect_, region_Marshal, region_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<Pointer<GpRegion>>} region_ 
     * @returns {Integer} 
     */
    static GdipCreateRegionPath(path_, region_) {
        region_Marshal := region_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateRegionPath", "ptr", path_, region_Marshal, region_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} regionData 
     * @param {Integer} size_ 
     * @param {Pointer<Pointer<GpRegion>>} region_ 
     * @returns {Integer} 
     */
    static GdipCreateRegionRgnData(regionData, size_, region_) {
        regionDataMarshal := regionData is VarRef ? "char*" : "ptr"
        region_Marshal := region_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateRegionRgnData", regionDataMarshal, regionData, "int", size_, region_Marshal, region_, "int")
        return result
    }

    /**
     * 
     * @param {HRGN} hRgn_ 
     * @param {Pointer<Pointer<GpRegion>>} region_ 
     * @returns {Integer} 
     */
    static GdipCreateRegionHrgn(hRgn_, region_) {
        hRgn_ := hRgn_ is Win32Handle ? NumGet(hRgn_, "ptr") : hRgn_

        region_Marshal := region_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateRegionHrgn", "ptr", hRgn_, region_Marshal, region_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Pointer<Pointer<GpRegion>>} cloneRegion 
     * @returns {Integer} 
     */
    static GdipCloneRegion(region_, cloneRegion) {
        cloneRegionMarshal := cloneRegion is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCloneRegion", "ptr", region_, cloneRegionMarshal, cloneRegion, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @returns {Integer} 
     */
    static GdipDeleteRegion(region_) {
        result := DllCall("gdiplus.dll\GdipDeleteRegion", "ptr", region_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @returns {Integer} 
     */
    static GdipSetInfinite(region_) {
        result := DllCall("gdiplus.dll\GdipSetInfinite", "ptr", region_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @returns {Integer} 
     */
    static GdipSetEmpty(region_) {
        result := DllCall("gdiplus.dll\GdipSetEmpty", "ptr", region_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Pointer<RectF>} rect_ 
     * @param {Integer} combineMode_ 
     * @returns {Integer} 
     */
    static GdipCombineRegionRect(region_, rect_, combineMode_) {
        result := DllCall("gdiplus.dll\GdipCombineRegionRect", "ptr", region_, "ptr", rect_, "int", combineMode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Pointer<Rect>} rect_ 
     * @param {Integer} combineMode_ 
     * @returns {Integer} 
     */
    static GdipCombineRegionRectI(region_, rect_, combineMode_) {
        result := DllCall("gdiplus.dll\GdipCombineRegionRectI", "ptr", region_, "ptr", rect_, "int", combineMode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Pointer<GpPath>} path_ 
     * @param {Integer} combineMode_ 
     * @returns {Integer} 
     */
    static GdipCombineRegionPath(region_, path_, combineMode_) {
        result := DllCall("gdiplus.dll\GdipCombineRegionPath", "ptr", region_, "ptr", path_, "int", combineMode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Pointer<GpRegion>} region2 
     * @param {Integer} combineMode_ 
     * @returns {Integer} 
     */
    static GdipCombineRegionRegion(region_, region2, combineMode_) {
        result := DllCall("gdiplus.dll\GdipCombineRegionRegion", "ptr", region_, "ptr", region2, "int", combineMode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Float} dx 
     * @param {Float} dy 
     * @returns {Integer} 
     */
    static GdipTranslateRegion(region_, dx, dy) {
        result := DllCall("gdiplus.dll\GdipTranslateRegion", "ptr", region_, "float", dx, "float", dy, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Integer} dx 
     * @param {Integer} dy 
     * @returns {Integer} 
     */
    static GdipTranslateRegionI(region_, dx, dy) {
        result := DllCall("gdiplus.dll\GdipTranslateRegionI", "ptr", region_, "int", dx, "int", dy, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Pointer<Matrix>} matrix_ 
     * @returns {Integer} 
     */
    static GdipTransformRegion(region_, matrix_) {
        result := DllCall("gdiplus.dll\GdipTransformRegion", "ptr", region_, "ptr", matrix_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<RectF>} rect_ 
     * @returns {Integer} 
     */
    static GdipGetRegionBounds(region_, graphics, rect_) {
        result := DllCall("gdiplus.dll\GdipGetRegionBounds", "ptr", region_, "ptr", graphics, "ptr", rect_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Rect>} rect_ 
     * @returns {Integer} 
     */
    static GdipGetRegionBoundsI(region_, graphics, rect_) {
        result := DllCall("gdiplus.dll\GdipGetRegionBoundsI", "ptr", region_, "ptr", graphics, "ptr", rect_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<HRGN>} hRgn_ 
     * @returns {Integer} 
     */
    static GdipGetRegionHRgn(region_, graphics, hRgn_) {
        result := DllCall("gdiplus.dll\GdipGetRegionHRgn", "ptr", region_, "ptr", graphics, "ptr", hRgn_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result_ 
     * @returns {Integer} 
     */
    static GdipIsEmptyRegion(region_, graphics, result_) {
        result_Marshal := result_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipIsEmptyRegion", "ptr", region_, "ptr", graphics, result_Marshal, result_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result_ 
     * @returns {Integer} 
     */
    static GdipIsInfiniteRegion(region_, graphics, result_) {
        result_Marshal := result_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipIsInfiniteRegion", "ptr", region_, "ptr", graphics, result_Marshal, result_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Pointer<GpRegion>} region2 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result_ 
     * @returns {Integer} 
     */
    static GdipIsEqualRegion(region_, region2, graphics, result_) {
        result_Marshal := result_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipIsEqualRegion", "ptr", region_, "ptr", region2, "ptr", graphics, result_Marshal, result_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Pointer<Integer>} bufferSize 
     * @returns {Integer} 
     */
    static GdipGetRegionDataSize(region_, bufferSize) {
        bufferSizeMarshal := bufferSize is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetRegionDataSize", "ptr", region_, bufferSizeMarshal, bufferSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Pointer<Integer>} buffer_ 
     * @param {Integer} bufferSize 
     * @param {Pointer<Integer>} sizeFilled 
     * @returns {Integer} 
     */
    static GdipGetRegionData(region_, buffer_, bufferSize, sizeFilled) {
        buffer_Marshal := buffer_ is VarRef ? "char*" : "ptr"
        sizeFilledMarshal := sizeFilled is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetRegionData", "ptr", region_, buffer_Marshal, buffer_, "uint", bufferSize, sizeFilledMarshal, sizeFilled, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result_ 
     * @returns {Integer} 
     */
    static GdipIsVisibleRegionPoint(region_, x, y, graphics, result_) {
        result_Marshal := result_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipIsVisibleRegionPoint", "ptr", region_, "float", x, "float", y, "ptr", graphics, result_Marshal, result_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result_ 
     * @returns {Integer} 
     */
    static GdipIsVisibleRegionPointI(region_, x, y, graphics, result_) {
        result_Marshal := result_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipIsVisibleRegionPointI", "ptr", region_, "int", x, "int", y, "ptr", graphics, result_Marshal, result_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result_ 
     * @returns {Integer} 
     */
    static GdipIsVisibleRegionRect(region_, x, y, width, height, graphics, result_) {
        result_Marshal := result_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipIsVisibleRegionRect", "ptr", region_, "float", x, "float", y, "float", width, "float", height, "ptr", graphics, result_Marshal, result_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result_ 
     * @returns {Integer} 
     */
    static GdipIsVisibleRegionRectI(region_, x, y, width, height, graphics, result_) {
        result_Marshal := result_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipIsVisibleRegionRectI", "ptr", region_, "int", x, "int", y, "int", width, "int", height, "ptr", graphics, result_Marshal, result_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Pointer<Integer>} count 
     * @param {Pointer<Matrix>} matrix_ 
     * @returns {Integer} 
     */
    static GdipGetRegionScansCount(region_, count, matrix_) {
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetRegionScansCount", "ptr", region_, countMarshal, count, "ptr", matrix_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Pointer<RectF>} rects 
     * @param {Pointer<Integer>} count 
     * @param {Pointer<Matrix>} matrix_ 
     * @returns {Integer} 
     */
    static GdipGetRegionScans(region_, rects, count, matrix_) {
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetRegionScans", "ptr", region_, "ptr", rects, countMarshal, count, "ptr", matrix_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Pointer<Rect>} rects 
     * @param {Pointer<Integer>} count 
     * @param {Pointer<Matrix>} matrix_ 
     * @returns {Integer} 
     */
    static GdipGetRegionScansI(region_, rects, count, matrix_) {
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetRegionScansI", "ptr", region_, "ptr", rects, countMarshal, count, "ptr", matrix_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<Pointer<GpBrush>>} cloneBrush 
     * @returns {Integer} 
     */
    static GdipCloneBrush(brush, cloneBrush) {
        cloneBrushMarshal := cloneBrush is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCloneBrush", "ptr", brush, cloneBrushMarshal, cloneBrush, "int")
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
     * @param {Pointer<Integer>} type 
     * @returns {Integer} 
     */
    static GdipGetBrushType(brush, type) {
        typeMarshal := type is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetBrushType", "ptr", brush, typeMarshal, type, "int")
        return result
    }

    /**
     * 
     * @param {Integer} hatchstyle_ 
     * @param {Integer} forecol 
     * @param {Integer} backcol 
     * @param {Pointer<Pointer<GpHatch>>} brush 
     * @returns {Integer} 
     */
    static GdipCreateHatchBrush(hatchstyle_, forecol, backcol, brush) {
        brushMarshal := brush is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateHatchBrush", "int", hatchstyle_, "uint", forecol, "uint", backcol, brushMarshal, brush, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpHatch>} brush 
     * @param {Pointer<Integer>} hatchstyle_ 
     * @returns {Integer} 
     */
    static GdipGetHatchStyle(brush, hatchstyle_) {
        hatchstyle_Marshal := hatchstyle_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetHatchStyle", "ptr", brush, hatchstyle_Marshal, hatchstyle_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpHatch>} brush 
     * @param {Pointer<Integer>} forecol 
     * @returns {Integer} 
     */
    static GdipGetHatchForegroundColor(brush, forecol) {
        forecolMarshal := forecol is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetHatchForegroundColor", "ptr", brush, forecolMarshal, forecol, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpHatch>} brush 
     * @param {Pointer<Integer>} backcol 
     * @returns {Integer} 
     */
    static GdipGetHatchBackgroundColor(brush, backcol) {
        backcolMarshal := backcol is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetHatchBackgroundColor", "ptr", brush, backcolMarshal, backcol, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Integer} wrapmode_ 
     * @param {Pointer<Pointer<GpTexture>>} texture 
     * @returns {Integer} 
     */
    static GdipCreateTexture(image_, wrapmode_, texture) {
        textureMarshal := texture is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateTexture", "ptr", image_, "int", wrapmode_, textureMarshal, texture, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Integer} wrapmode_ 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @param {Pointer<Pointer<GpTexture>>} texture 
     * @returns {Integer} 
     */
    static GdipCreateTexture2(image_, wrapmode_, x, y, width, height, texture) {
        textureMarshal := texture is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateTexture2", "ptr", image_, "int", wrapmode_, "float", x, "float", y, "float", width, "float", height, textureMarshal, texture, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @param {Pointer<Pointer<GpTexture>>} texture 
     * @returns {Integer} 
     */
    static GdipCreateTextureIA(image_, imageAttributes, x, y, width, height, texture) {
        textureMarshal := texture is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateTextureIA", "ptr", image_, "ptr", imageAttributes, "float", x, "float", y, "float", width, "float", height, textureMarshal, texture, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Integer} wrapmode_ 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Pointer<Pointer<GpTexture>>} texture 
     * @returns {Integer} 
     */
    static GdipCreateTexture2I(image_, wrapmode_, x, y, width, height, texture) {
        textureMarshal := texture is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateTexture2I", "ptr", image_, "int", wrapmode_, "int", x, "int", y, "int", width, "int", height, textureMarshal, texture, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Pointer<Pointer<GpTexture>>} texture 
     * @returns {Integer} 
     */
    static GdipCreateTextureIAI(image_, imageAttributes, x, y, width, height, texture) {
        textureMarshal := texture is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateTextureIAI", "ptr", image_, "ptr", imageAttributes, "int", x, "int", y, "int", width, "int", height, textureMarshal, texture, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpTexture>} brush 
     * @param {Pointer<Matrix>} matrix_ 
     * @returns {Integer} 
     */
    static GdipGetTextureTransform(brush, matrix_) {
        result := DllCall("gdiplus.dll\GdipGetTextureTransform", "ptr", brush, "ptr", matrix_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpTexture>} brush 
     * @param {Pointer<Matrix>} matrix_ 
     * @returns {Integer} 
     */
    static GdipSetTextureTransform(brush, matrix_) {
        result := DllCall("gdiplus.dll\GdipSetTextureTransform", "ptr", brush, "ptr", matrix_, "int")
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
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipMultiplyTextureTransform(brush, matrix_, order) {
        result := DllCall("gdiplus.dll\GdipMultiplyTextureTransform", "ptr", brush, "ptr", matrix_, "int", order, "int")
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
     * @param {Integer} wrapmode_ 
     * @returns {Integer} 
     */
    static GdipSetTextureWrapMode(brush, wrapmode_) {
        result := DllCall("gdiplus.dll\GdipSetTextureWrapMode", "ptr", brush, "int", wrapmode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpTexture>} brush 
     * @param {Pointer<Integer>} wrapmode_ 
     * @returns {Integer} 
     */
    static GdipGetTextureWrapMode(brush, wrapmode_) {
        wrapmode_Marshal := wrapmode_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetTextureWrapMode", "ptr", brush, wrapmode_Marshal, wrapmode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpTexture>} brush 
     * @param {Pointer<Pointer<GpImage>>} image_ 
     * @returns {Integer} 
     */
    static GdipGetTextureImage(brush, image_) {
        image_Marshal := image_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetTextureImage", "ptr", brush, image_Marshal, image_, "int")
        return result
    }

    /**
     * 
     * @param {Integer} color_ 
     * @param {Pointer<Pointer<GpSolidFill>>} brush 
     * @returns {Integer} 
     */
    static GdipCreateSolidFill(color_, brush) {
        brushMarshal := brush is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateSolidFill", "uint", color_, brushMarshal, brush, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpSolidFill>} brush 
     * @param {Integer} color_ 
     * @returns {Integer} 
     */
    static GdipSetSolidFillColor(brush, color_) {
        result := DllCall("gdiplus.dll\GdipSetSolidFillColor", "ptr", brush, "uint", color_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpSolidFill>} brush 
     * @param {Pointer<Integer>} color_ 
     * @returns {Integer} 
     */
    static GdipGetSolidFillColor(brush, color_) {
        color_Marshal := color_ is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetSolidFillColor", "ptr", brush, color_Marshal, color_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PointF>} point1 
     * @param {Pointer<PointF>} point2 
     * @param {Integer} color1 
     * @param {Integer} color2 
     * @param {Integer} wrapMode_ 
     * @param {Pointer<Pointer<GpLineGradient>>} lineGradient 
     * @returns {Integer} 
     */
    static GdipCreateLineBrush(point1, point2, color1, color2, wrapMode_, lineGradient) {
        lineGradientMarshal := lineGradient is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateLineBrush", "ptr", point1, "ptr", point2, "uint", color1, "uint", color2, "int", wrapMode_, lineGradientMarshal, lineGradient, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Point>} point1 
     * @param {Pointer<Point>} point2 
     * @param {Integer} color1 
     * @param {Integer} color2 
     * @param {Integer} wrapMode_ 
     * @param {Pointer<Pointer<GpLineGradient>>} lineGradient 
     * @returns {Integer} 
     */
    static GdipCreateLineBrushI(point1, point2, color1, color2, wrapMode_, lineGradient) {
        lineGradientMarshal := lineGradient is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateLineBrushI", "ptr", point1, "ptr", point2, "uint", color1, "uint", color2, "int", wrapMode_, lineGradientMarshal, lineGradient, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RectF>} rect_ 
     * @param {Integer} color1 
     * @param {Integer} color2 
     * @param {Integer} mode_ 
     * @param {Integer} wrapMode_ 
     * @param {Pointer<Pointer<GpLineGradient>>} lineGradient 
     * @returns {Integer} 
     */
    static GdipCreateLineBrushFromRect(rect_, color1, color2, mode_, wrapMode_, lineGradient) {
        lineGradientMarshal := lineGradient is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateLineBrushFromRect", "ptr", rect_, "uint", color1, "uint", color2, "int", mode_, "int", wrapMode_, lineGradientMarshal, lineGradient, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Rect>} rect_ 
     * @param {Integer} color1 
     * @param {Integer} color2 
     * @param {Integer} mode_ 
     * @param {Integer} wrapMode_ 
     * @param {Pointer<Pointer<GpLineGradient>>} lineGradient 
     * @returns {Integer} 
     */
    static GdipCreateLineBrushFromRectI(rect_, color1, color2, mode_, wrapMode_, lineGradient) {
        lineGradientMarshal := lineGradient is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateLineBrushFromRectI", "ptr", rect_, "uint", color1, "uint", color2, "int", mode_, "int", wrapMode_, lineGradientMarshal, lineGradient, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RectF>} rect_ 
     * @param {Integer} color1 
     * @param {Integer} color2 
     * @param {Float} angle 
     * @param {BOOL} isAngleScalable 
     * @param {Integer} wrapMode_ 
     * @param {Pointer<Pointer<GpLineGradient>>} lineGradient 
     * @returns {Integer} 
     */
    static GdipCreateLineBrushFromRectWithAngle(rect_, color1, color2, angle, isAngleScalable, wrapMode_, lineGradient) {
        lineGradientMarshal := lineGradient is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateLineBrushFromRectWithAngle", "ptr", rect_, "uint", color1, "uint", color2, "float", angle, "int", isAngleScalable, "int", wrapMode_, lineGradientMarshal, lineGradient, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Rect>} rect_ 
     * @param {Integer} color1 
     * @param {Integer} color2 
     * @param {Float} angle 
     * @param {BOOL} isAngleScalable 
     * @param {Integer} wrapMode_ 
     * @param {Pointer<Pointer<GpLineGradient>>} lineGradient 
     * @returns {Integer} 
     */
    static GdipCreateLineBrushFromRectWithAngleI(rect_, color1, color2, angle, isAngleScalable, wrapMode_, lineGradient) {
        lineGradientMarshal := lineGradient is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateLineBrushFromRectWithAngleI", "ptr", rect_, "uint", color1, "uint", color2, "float", angle, "int", isAngleScalable, "int", wrapMode_, lineGradientMarshal, lineGradient, "int")
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
     * @param {Pointer<Integer>} colors 
     * @returns {Integer} 
     */
    static GdipGetLineColors(brush, colors) {
        colorsMarshal := colors is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetLineColors", "ptr", brush, colorsMarshal, colors, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<RectF>} rect_ 
     * @returns {Integer} 
     */
    static GdipGetLineRect(brush, rect_) {
        result := DllCall("gdiplus.dll\GdipGetLineRect", "ptr", brush, "ptr", rect_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<Rect>} rect_ 
     * @returns {Integer} 
     */
    static GdipGetLineRectI(brush, rect_) {
        result := DllCall("gdiplus.dll\GdipGetLineRectI", "ptr", brush, "ptr", rect_, "int")
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
        useGammaCorrectionMarshal := useGammaCorrection is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetLineGammaCorrection", "ptr", brush, useGammaCorrectionMarshal, useGammaCorrection, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<Integer>} count 
     * @returns {Integer} 
     */
    static GdipGetLineBlendCount(brush, count) {
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetLineBlendCount", "ptr", brush, countMarshal, count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<Float>} blend 
     * @param {Pointer<Float>} positions 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipGetLineBlend(brush, blend, positions, count) {
        blendMarshal := blend is VarRef ? "float*" : "ptr"
        positionsMarshal := positions is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetLineBlend", "ptr", brush, blendMarshal, blend, positionsMarshal, positions, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<Float>} blend 
     * @param {Pointer<Float>} positions 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipSetLineBlend(brush, blend, positions, count) {
        blendMarshal := blend is VarRef ? "float*" : "ptr"
        positionsMarshal := positions is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipSetLineBlend", "ptr", brush, blendMarshal, blend, positionsMarshal, positions, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<Integer>} count 
     * @returns {Integer} 
     */
    static GdipGetLinePresetBlendCount(brush, count) {
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetLinePresetBlendCount", "ptr", brush, countMarshal, count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<Integer>} blend 
     * @param {Pointer<Float>} positions 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipGetLinePresetBlend(brush, blend, positions, count) {
        blendMarshal := blend is VarRef ? "uint*" : "ptr"
        positionsMarshal := positions is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetLinePresetBlend", "ptr", brush, blendMarshal, blend, positionsMarshal, positions, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<Integer>} blend 
     * @param {Pointer<Float>} positions 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipSetLinePresetBlend(brush, blend, positions, count) {
        blendMarshal := blend is VarRef ? "uint*" : "ptr"
        positionsMarshal := positions is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipSetLinePresetBlend", "ptr", brush, blendMarshal, blend, positionsMarshal, positions, "int", count, "int")
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
     * @param {Integer} wrapmode_ 
     * @returns {Integer} 
     */
    static GdipSetLineWrapMode(brush, wrapmode_) {
        result := DllCall("gdiplus.dll\GdipSetLineWrapMode", "ptr", brush, "int", wrapmode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<Integer>} wrapmode_ 
     * @returns {Integer} 
     */
    static GdipGetLineWrapMode(brush, wrapmode_) {
        wrapmode_Marshal := wrapmode_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetLineWrapMode", "ptr", brush, wrapmode_Marshal, wrapmode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<Matrix>} matrix_ 
     * @returns {Integer} 
     */
    static GdipGetLineTransform(brush, matrix_) {
        result := DllCall("gdiplus.dll\GdipGetLineTransform", "ptr", brush, "ptr", matrix_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpLineGradient>} brush 
     * @param {Pointer<Matrix>} matrix_ 
     * @returns {Integer} 
     */
    static GdipSetLineTransform(brush, matrix_) {
        result := DllCall("gdiplus.dll\GdipSetLineTransform", "ptr", brush, "ptr", matrix_, "int")
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
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipMultiplyLineTransform(brush, matrix_, order) {
        result := DllCall("gdiplus.dll\GdipMultiplyLineTransform", "ptr", brush, "ptr", matrix_, "int", order, "int")
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
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @param {Integer} wrapMode_ 
     * @param {Pointer<Pointer<GpPathGradient>>} polyGradient 
     * @returns {Integer} 
     */
    static GdipCreatePathGradient(points_, count, wrapMode_, polyGradient) {
        polyGradientMarshal := polyGradient is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreatePathGradient", "ptr", points_, "int", count, "int", wrapMode_, polyGradientMarshal, polyGradient, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Point>} points_ 
     * @param {Integer} count 
     * @param {Integer} wrapMode_ 
     * @param {Pointer<Pointer<GpPathGradient>>} polyGradient 
     * @returns {Integer} 
     */
    static GdipCreatePathGradientI(points_, count, wrapMode_, polyGradient) {
        polyGradientMarshal := polyGradient is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreatePathGradientI", "ptr", points_, "int", count, "int", wrapMode_, polyGradientMarshal, polyGradient, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} path_ 
     * @param {Pointer<Pointer<GpPathGradient>>} polyGradient 
     * @returns {Integer} 
     */
    static GdipCreatePathGradientFromPath(path_, polyGradient) {
        polyGradientMarshal := polyGradient is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreatePathGradientFromPath", "ptr", path_, polyGradientMarshal, polyGradient, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Integer>} colors 
     * @returns {Integer} 
     */
    static GdipGetPathGradientCenterColor(brush, colors) {
        colorsMarshal := colors is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPathGradientCenterColor", "ptr", brush, colorsMarshal, colors, "int")
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
     * @param {Pointer<Integer>} color_ 
     * @param {Pointer<Integer>} count 
     * @returns {Integer} 
     */
    static GdipGetPathGradientSurroundColorsWithCount(brush, color_, count) {
        color_Marshal := color_ is VarRef ? "uint*" : "ptr"
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPathGradientSurroundColorsWithCount", "ptr", brush, color_Marshal, color_, countMarshal, count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Integer>} color_ 
     * @param {Pointer<Integer>} count 
     * @returns {Integer} 
     */
    static GdipSetPathGradientSurroundColorsWithCount(brush, color_, count) {
        color_Marshal := color_ is VarRef ? "uint*" : "ptr"
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipSetPathGradientSurroundColorsWithCount", "ptr", brush, color_Marshal, color_, countMarshal, count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<GpPath>} path_ 
     * @returns {Integer} 
     */
    static GdipGetPathGradientPath(brush, path_) {
        result := DllCall("gdiplus.dll\GdipGetPathGradientPath", "ptr", brush, "ptr", path_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<GpPath>} path_ 
     * @returns {Integer} 
     */
    static GdipSetPathGradientPath(brush, path_) {
        result := DllCall("gdiplus.dll\GdipSetPathGradientPath", "ptr", brush, "ptr", path_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<PointF>} points_ 
     * @returns {Integer} 
     */
    static GdipGetPathGradientCenterPoint(brush, points_) {
        result := DllCall("gdiplus.dll\GdipGetPathGradientCenterPoint", "ptr", brush, "ptr", points_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Point>} points_ 
     * @returns {Integer} 
     */
    static GdipGetPathGradientCenterPointI(brush, points_) {
        result := DllCall("gdiplus.dll\GdipGetPathGradientCenterPointI", "ptr", brush, "ptr", points_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<PointF>} points_ 
     * @returns {Integer} 
     */
    static GdipSetPathGradientCenterPoint(brush, points_) {
        result := DllCall("gdiplus.dll\GdipSetPathGradientCenterPoint", "ptr", brush, "ptr", points_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Point>} points_ 
     * @returns {Integer} 
     */
    static GdipSetPathGradientCenterPointI(brush, points_) {
        result := DllCall("gdiplus.dll\GdipSetPathGradientCenterPointI", "ptr", brush, "ptr", points_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<RectF>} rect_ 
     * @returns {Integer} 
     */
    static GdipGetPathGradientRect(brush, rect_) {
        result := DllCall("gdiplus.dll\GdipGetPathGradientRect", "ptr", brush, "ptr", rect_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Rect>} rect_ 
     * @returns {Integer} 
     */
    static GdipGetPathGradientRectI(brush, rect_) {
        result := DllCall("gdiplus.dll\GdipGetPathGradientRectI", "ptr", brush, "ptr", rect_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Integer>} count 
     * @returns {Integer} 
     */
    static GdipGetPathGradientPointCount(brush, count) {
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPathGradientPointCount", "ptr", brush, countMarshal, count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Integer>} count 
     * @returns {Integer} 
     */
    static GdipGetPathGradientSurroundColorCount(brush, count) {
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPathGradientSurroundColorCount", "ptr", brush, countMarshal, count, "int")
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
        useGammaCorrectionMarshal := useGammaCorrection is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPathGradientGammaCorrection", "ptr", brush, useGammaCorrectionMarshal, useGammaCorrection, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Integer>} count 
     * @returns {Integer} 
     */
    static GdipGetPathGradientBlendCount(brush, count) {
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPathGradientBlendCount", "ptr", brush, countMarshal, count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Float>} blend 
     * @param {Pointer<Float>} positions 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipGetPathGradientBlend(brush, blend, positions, count) {
        blendMarshal := blend is VarRef ? "float*" : "ptr"
        positionsMarshal := positions is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPathGradientBlend", "ptr", brush, blendMarshal, blend, positionsMarshal, positions, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Float>} blend 
     * @param {Pointer<Float>} positions 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipSetPathGradientBlend(brush, blend, positions, count) {
        blendMarshal := blend is VarRef ? "float*" : "ptr"
        positionsMarshal := positions is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipSetPathGradientBlend", "ptr", brush, blendMarshal, blend, positionsMarshal, positions, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Integer>} count 
     * @returns {Integer} 
     */
    static GdipGetPathGradientPresetBlendCount(brush, count) {
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPathGradientPresetBlendCount", "ptr", brush, countMarshal, count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Integer>} blend 
     * @param {Pointer<Float>} positions 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipGetPathGradientPresetBlend(brush, blend, positions, count) {
        blendMarshal := blend is VarRef ? "uint*" : "ptr"
        positionsMarshal := positions is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPathGradientPresetBlend", "ptr", brush, blendMarshal, blend, positionsMarshal, positions, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Integer>} blend 
     * @param {Pointer<Float>} positions 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipSetPathGradientPresetBlend(brush, blend, positions, count) {
        blendMarshal := blend is VarRef ? "uint*" : "ptr"
        positionsMarshal := positions is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipSetPathGradientPresetBlend", "ptr", brush, blendMarshal, blend, positionsMarshal, positions, "int", count, "int")
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
     * @param {Pointer<Integer>} wrapmode_ 
     * @returns {Integer} 
     */
    static GdipGetPathGradientWrapMode(brush, wrapmode_) {
        wrapmode_Marshal := wrapmode_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPathGradientWrapMode", "ptr", brush, wrapmode_Marshal, wrapmode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Integer} wrapmode_ 
     * @returns {Integer} 
     */
    static GdipSetPathGradientWrapMode(brush, wrapmode_) {
        result := DllCall("gdiplus.dll\GdipSetPathGradientWrapMode", "ptr", brush, "int", wrapmode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Matrix>} matrix_ 
     * @returns {Integer} 
     */
    static GdipGetPathGradientTransform(brush, matrix_) {
        result := DllCall("gdiplus.dll\GdipGetPathGradientTransform", "ptr", brush, "ptr", matrix_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPathGradient>} brush 
     * @param {Pointer<Matrix>} matrix_ 
     * @returns {Integer} 
     */
    static GdipSetPathGradientTransform(brush, matrix_) {
        result := DllCall("gdiplus.dll\GdipSetPathGradientTransform", "ptr", brush, "ptr", matrix_, "int")
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
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipMultiplyPathGradientTransform(brush, matrix_, order) {
        result := DllCall("gdiplus.dll\GdipMultiplyPathGradientTransform", "ptr", brush, "ptr", matrix_, "int", order, "int")
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
     * @param {Pointer<Float>} xScale 
     * @param {Pointer<Float>} yScale 
     * @returns {Integer} 
     */
    static GdipGetPathGradientFocusScales(brush, xScale, yScale) {
        xScaleMarshal := xScale is VarRef ? "float*" : "ptr"
        yScaleMarshal := yScale is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPathGradientFocusScales", "ptr", brush, xScaleMarshal, xScale, yScaleMarshal, yScale, "int")
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
     * @param {Integer} color_ 
     * @param {Float} width 
     * @param {Integer} unit_ 
     * @param {Pointer<Pointer<GpPen>>} pen 
     * @returns {Integer} 
     */
    static GdipCreatePen1(color_, width, unit_, pen) {
        penMarshal := pen is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreatePen1", "uint", color_, "float", width, "int", unit_, penMarshal, pen, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBrush>} brush 
     * @param {Float} width 
     * @param {Integer} unit_ 
     * @param {Pointer<Pointer<GpPen>>} pen 
     * @returns {Integer} 
     */
    static GdipCreatePen2(brush, width, unit_, pen) {
        penMarshal := pen is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreatePen2", "ptr", brush, "float", width, "int", unit_, penMarshal, pen, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Pointer<GpPen>>} clonepen 
     * @returns {Integer} 
     */
    static GdipClonePen(pen, clonepen) {
        clonepenMarshal := clonepen is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipClonePen", "ptr", pen, clonepenMarshal, clonepen, "int")
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
     * @param {Pointer<Float>} width 
     * @returns {Integer} 
     */
    static GdipGetPenWidth(pen, width) {
        widthMarshal := width is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPenWidth", "ptr", pen, widthMarshal, width, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Integer} unit_ 
     * @returns {Integer} 
     */
    static GdipSetPenUnit(pen, unit_) {
        result := DllCall("gdiplus.dll\GdipSetPenUnit", "ptr", pen, "int", unit_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Integer>} unit_ 
     * @returns {Integer} 
     */
    static GdipGetPenUnit(pen, unit_) {
        unit_Marshal := unit_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPenUnit", "ptr", pen, unit_Marshal, unit_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Integer} startCap 
     * @param {Integer} endCap 
     * @param {Integer} dashCap_ 
     * @returns {Integer} 
     */
    static GdipSetPenLineCap197819(pen, startCap, endCap, dashCap_) {
        result := DllCall("gdiplus.dll\GdipSetPenLineCap197819", "ptr", pen, "int", startCap, "int", endCap, "int", dashCap_, "int")
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
     * @param {Integer} dashCap_ 
     * @returns {Integer} 
     */
    static GdipSetPenDashCap197819(pen, dashCap_) {
        result := DllCall("gdiplus.dll\GdipSetPenDashCap197819", "ptr", pen, "int", dashCap_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Integer>} startCap 
     * @returns {Integer} 
     */
    static GdipGetPenStartCap(pen, startCap) {
        startCapMarshal := startCap is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPenStartCap", "ptr", pen, startCapMarshal, startCap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Integer>} endCap 
     * @returns {Integer} 
     */
    static GdipGetPenEndCap(pen, endCap) {
        endCapMarshal := endCap is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPenEndCap", "ptr", pen, endCapMarshal, endCap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Integer>} dashCap_ 
     * @returns {Integer} 
     */
    static GdipGetPenDashCap197819(pen, dashCap_) {
        dashCap_Marshal := dashCap_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPenDashCap197819", "ptr", pen, dashCap_Marshal, dashCap_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Integer} lineJoin_ 
     * @returns {Integer} 
     */
    static GdipSetPenLineJoin(pen, lineJoin_) {
        result := DllCall("gdiplus.dll\GdipSetPenLineJoin", "ptr", pen, "int", lineJoin_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Integer>} lineJoin_ 
     * @returns {Integer} 
     */
    static GdipGetPenLineJoin(pen, lineJoin_) {
        lineJoin_Marshal := lineJoin_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPenLineJoin", "ptr", pen, lineJoin_Marshal, lineJoin_, "int")
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
     * @param {Pointer<Pointer<GpCustomLineCap>>} customCap 
     * @returns {Integer} 
     */
    static GdipGetPenCustomStartCap(pen, customCap) {
        customCapMarshal := customCap is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPenCustomStartCap", "ptr", pen, customCapMarshal, customCap, "int")
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
     * @param {Pointer<Pointer<GpCustomLineCap>>} customCap 
     * @returns {Integer} 
     */
    static GdipGetPenCustomEndCap(pen, customCap) {
        customCapMarshal := customCap is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPenCustomEndCap", "ptr", pen, customCapMarshal, customCap, "int")
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
     * @param {Pointer<Float>} miterLimit 
     * @returns {Integer} 
     */
    static GdipGetPenMiterLimit(pen, miterLimit) {
        miterLimitMarshal := miterLimit is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPenMiterLimit", "ptr", pen, miterLimitMarshal, miterLimit, "int")
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
     * @param {Pointer<Integer>} penMode 
     * @returns {Integer} 
     */
    static GdipGetPenMode(pen, penMode) {
        penModeMarshal := penMode is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPenMode", "ptr", pen, penModeMarshal, penMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Matrix>} matrix_ 
     * @returns {Integer} 
     */
    static GdipSetPenTransform(pen, matrix_) {
        result := DllCall("gdiplus.dll\GdipSetPenTransform", "ptr", pen, "ptr", matrix_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Matrix>} matrix_ 
     * @returns {Integer} 
     */
    static GdipGetPenTransform(pen, matrix_) {
        result := DllCall("gdiplus.dll\GdipGetPenTransform", "ptr", pen, "ptr", matrix_, "int")
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
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipMultiplyPenTransform(pen, matrix_, order) {
        result := DllCall("gdiplus.dll\GdipMultiplyPenTransform", "ptr", pen, "ptr", matrix_, "int", order, "int")
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
     * @param {Pointer<Integer>} argb 
     * @returns {Integer} 
     */
    static GdipGetPenColor(pen, argb) {
        argbMarshal := argb is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPenColor", "ptr", pen, argbMarshal, argb, "int")
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
     * @param {Pointer<Pointer<GpBrush>>} brush 
     * @returns {Integer} 
     */
    static GdipGetPenBrushFill(pen, brush) {
        brushMarshal := brush is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPenBrushFill", "ptr", pen, brushMarshal, brush, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Integer>} type 
     * @returns {Integer} 
     */
    static GdipGetPenFillType(pen, type) {
        typeMarshal := type is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPenFillType", "ptr", pen, typeMarshal, type, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Integer>} dashstyle_ 
     * @returns {Integer} 
     */
    static GdipGetPenDashStyle(pen, dashstyle_) {
        dashstyle_Marshal := dashstyle_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPenDashStyle", "ptr", pen, dashstyle_Marshal, dashstyle_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Integer} dashstyle_ 
     * @returns {Integer} 
     */
    static GdipSetPenDashStyle(pen, dashstyle_) {
        result := DllCall("gdiplus.dll\GdipSetPenDashStyle", "ptr", pen, "int", dashstyle_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Float>} offset 
     * @returns {Integer} 
     */
    static GdipGetPenDashOffset(pen, offset) {
        offsetMarshal := offset is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPenDashOffset", "ptr", pen, offsetMarshal, offset, "int")
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
     * @param {Pointer<Integer>} count 
     * @returns {Integer} 
     */
    static GdipGetPenDashCount(pen, count) {
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPenDashCount", "ptr", pen, countMarshal, count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Float>} dash 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipSetPenDashArray(pen, dash, count) {
        dashMarshal := dash is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipSetPenDashArray", "ptr", pen, dashMarshal, dash, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Float>} dash 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipGetPenDashArray(pen, dash, count) {
        dashMarshal := dash is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPenDashArray", "ptr", pen, dashMarshal, dash, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Integer>} count 
     * @returns {Integer} 
     */
    static GdipGetPenCompoundCount(pen, count) {
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPenCompoundCount", "ptr", pen, countMarshal, count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Float>} dash 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipSetPenCompoundArray(pen, dash, count) {
        dashMarshal := dash is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipSetPenCompoundArray", "ptr", pen, dashMarshal, dash, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Float>} dash 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipGetPenCompoundArray(pen, dash, count) {
        dashMarshal := dash is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPenCompoundArray", "ptr", pen, dashMarshal, dash, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpPath>} fillPath 
     * @param {Pointer<GpPath>} strokePath 
     * @param {Integer} baseCap 
     * @param {Float} baseInset 
     * @param {Pointer<Pointer<GpCustomLineCap>>} customCap 
     * @returns {Integer} 
     */
    static GdipCreateCustomLineCap(fillPath, strokePath, baseCap, baseInset, customCap) {
        customCapMarshal := customCap is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateCustomLineCap", "ptr", fillPath, "ptr", strokePath, "int", baseCap, "float", baseInset, customCapMarshal, customCap, "int")
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
     * @param {Pointer<Pointer<GpCustomLineCap>>} clonedCap 
     * @returns {Integer} 
     */
    static GdipCloneCustomLineCap(customCap, clonedCap) {
        clonedCapMarshal := clonedCap is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCloneCustomLineCap", "ptr", customCap, clonedCapMarshal, clonedCap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpCustomLineCap>} customCap 
     * @param {Pointer<Integer>} capType 
     * @returns {Integer} 
     */
    static GdipGetCustomLineCapType(customCap, capType) {
        capTypeMarshal := capType is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetCustomLineCapType", "ptr", customCap, capTypeMarshal, capType, "int")
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
     * @param {Pointer<Integer>} startCap 
     * @param {Pointer<Integer>} endCap 
     * @returns {Integer} 
     */
    static GdipGetCustomLineCapStrokeCaps(customCap, startCap, endCap) {
        startCapMarshal := startCap is VarRef ? "int*" : "ptr"
        endCapMarshal := endCap is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetCustomLineCapStrokeCaps", "ptr", customCap, startCapMarshal, startCap, endCapMarshal, endCap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpCustomLineCap>} customCap 
     * @param {Integer} lineJoin_ 
     * @returns {Integer} 
     */
    static GdipSetCustomLineCapStrokeJoin(customCap, lineJoin_) {
        result := DllCall("gdiplus.dll\GdipSetCustomLineCapStrokeJoin", "ptr", customCap, "int", lineJoin_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpCustomLineCap>} customCap 
     * @param {Pointer<Integer>} lineJoin_ 
     * @returns {Integer} 
     */
    static GdipGetCustomLineCapStrokeJoin(customCap, lineJoin_) {
        lineJoin_Marshal := lineJoin_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetCustomLineCapStrokeJoin", "ptr", customCap, lineJoin_Marshal, lineJoin_, "int")
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
     * @param {Pointer<Integer>} baseCap 
     * @returns {Integer} 
     */
    static GdipGetCustomLineCapBaseCap(customCap, baseCap) {
        baseCapMarshal := baseCap is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetCustomLineCapBaseCap", "ptr", customCap, baseCapMarshal, baseCap, "int")
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
     * @param {Pointer<Float>} inset 
     * @returns {Integer} 
     */
    static GdipGetCustomLineCapBaseInset(customCap, inset) {
        insetMarshal := inset is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetCustomLineCapBaseInset", "ptr", customCap, insetMarshal, inset, "int")
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
     * @param {Pointer<Float>} widthScale 
     * @returns {Integer} 
     */
    static GdipGetCustomLineCapWidthScale(customCap, widthScale) {
        widthScaleMarshal := widthScale is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetCustomLineCapWidthScale", "ptr", customCap, widthScaleMarshal, widthScale, "int")
        return result
    }

    /**
     * 
     * @param {Float} height 
     * @param {Float} width 
     * @param {BOOL} isFilled 
     * @param {Pointer<Pointer<GpAdjustableArrowCap>>} cap 
     * @returns {Integer} 
     */
    static GdipCreateAdjustableArrowCap(height, width, isFilled, cap) {
        capMarshal := cap is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateAdjustableArrowCap", "float", height, "float", width, "int", isFilled, capMarshal, cap, "int")
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
     * @param {Pointer<Float>} height 
     * @returns {Integer} 
     */
    static GdipGetAdjustableArrowCapHeight(cap, height) {
        heightMarshal := height is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetAdjustableArrowCapHeight", "ptr", cap, heightMarshal, height, "int")
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
     * @param {Pointer<Float>} width 
     * @returns {Integer} 
     */
    static GdipGetAdjustableArrowCapWidth(cap, width) {
        widthMarshal := width is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetAdjustableArrowCapWidth", "ptr", cap, widthMarshal, width, "int")
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
     * @param {Pointer<Float>} middleInset 
     * @returns {Integer} 
     */
    static GdipGetAdjustableArrowCapMiddleInset(cap, middleInset) {
        middleInsetMarshal := middleInset is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetAdjustableArrowCapMiddleInset", "ptr", cap, middleInsetMarshal, middleInset, "int")
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
        fillStateMarshal := fillState is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetAdjustableArrowCapFillState", "ptr", cap, fillStateMarshal, fillState, "int")
        return result
    }

    /**
     * 
     * @param {IStream} stream 
     * @param {Pointer<Pointer<GpImage>>} image_ 
     * @returns {Integer} 
     */
    static GdipLoadImageFromStream(stream, image_) {
        image_Marshal := image_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipLoadImageFromStream", "ptr", stream, image_Marshal, image_, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} filename 
     * @param {Pointer<Pointer<GpImage>>} image_ 
     * @returns {Integer} 
     */
    static GdipLoadImageFromFile(filename, image_) {
        filename := filename is String ? StrPtr(filename) : filename

        image_Marshal := image_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipLoadImageFromFile", "ptr", filename, image_Marshal, image_, "int")
        return result
    }

    /**
     * 
     * @param {IStream} stream 
     * @param {Pointer<Pointer<GpImage>>} image_ 
     * @returns {Integer} 
     */
    static GdipLoadImageFromStreamICM(stream, image_) {
        image_Marshal := image_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipLoadImageFromStreamICM", "ptr", stream, image_Marshal, image_, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} filename 
     * @param {Pointer<Pointer<GpImage>>} image_ 
     * @returns {Integer} 
     */
    static GdipLoadImageFromFileICM(filename, image_) {
        filename := filename is String ? StrPtr(filename) : filename

        image_Marshal := image_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipLoadImageFromFileICM", "ptr", filename, image_Marshal, image_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<Pointer<GpImage>>} cloneImage 
     * @returns {Integer} 
     */
    static GdipCloneImage(image_, cloneImage) {
        cloneImageMarshal := cloneImage is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCloneImage", "ptr", image_, cloneImageMarshal, cloneImage, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @returns {Integer} 
     */
    static GdipDisposeImage(image_) {
        result := DllCall("gdiplus.dll\GdipDisposeImage", "ptr", image_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {PWSTR} filename 
     * @param {Pointer<Guid>} clsidEncoder 
     * @param {Pointer<EncoderParameters>} encoderParams 
     * @returns {Integer} 
     */
    static GdipSaveImageToFile(image_, filename, clsidEncoder, encoderParams) {
        filename := filename is String ? StrPtr(filename) : filename

        result := DllCall("gdiplus.dll\GdipSaveImageToFile", "ptr", image_, "ptr", filename, "ptr", clsidEncoder, "ptr", encoderParams, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {IStream} stream 
     * @param {Pointer<Guid>} clsidEncoder 
     * @param {Pointer<EncoderParameters>} encoderParams 
     * @returns {Integer} 
     */
    static GdipSaveImageToStream(image_, stream, clsidEncoder, encoderParams) {
        result := DllCall("gdiplus.dll\GdipSaveImageToStream", "ptr", image_, "ptr", stream, "ptr", clsidEncoder, "ptr", encoderParams, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<EncoderParameters>} encoderParams 
     * @returns {Integer} 
     */
    static GdipSaveAdd(image_, encoderParams) {
        result := DllCall("gdiplus.dll\GdipSaveAdd", "ptr", image_, "ptr", encoderParams, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<GpImage>} newImage 
     * @param {Pointer<EncoderParameters>} encoderParams 
     * @returns {Integer} 
     */
    static GdipSaveAddImage(image_, newImage, encoderParams) {
        result := DllCall("gdiplus.dll\GdipSaveAddImage", "ptr", image_, "ptr", newImage, "ptr", encoderParams, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<Pointer<GpGraphics>>} graphics 
     * @returns {Integer} 
     */
    static GdipGetImageGraphicsContext(image_, graphics) {
        graphicsMarshal := graphics is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetImageGraphicsContext", "ptr", image_, graphicsMarshal, graphics, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<RectF>} srcRect 
     * @param {Pointer<Integer>} srcUnit 
     * @returns {Integer} 
     */
    static GdipGetImageBounds(image_, srcRect, srcUnit) {
        srcUnitMarshal := srcUnit is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetImageBounds", "ptr", image_, "ptr", srcRect, srcUnitMarshal, srcUnit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<Float>} width 
     * @param {Pointer<Float>} height 
     * @returns {Integer} 
     */
    static GdipGetImageDimension(image_, width, height) {
        widthMarshal := width is VarRef ? "float*" : "ptr"
        heightMarshal := height is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetImageDimension", "ptr", image_, widthMarshal, width, heightMarshal, height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<Integer>} type 
     * @returns {Integer} 
     */
    static GdipGetImageType(image_, type) {
        typeMarshal := type is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetImageType", "ptr", image_, typeMarshal, type, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<Integer>} width 
     * @returns {Integer} 
     */
    static GdipGetImageWidth(image_, width) {
        widthMarshal := width is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetImageWidth", "ptr", image_, widthMarshal, width, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<Integer>} height 
     * @returns {Integer} 
     */
    static GdipGetImageHeight(image_, height) {
        heightMarshal := height is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetImageHeight", "ptr", image_, heightMarshal, height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<Float>} resolution 
     * @returns {Integer} 
     */
    static GdipGetImageHorizontalResolution(image_, resolution) {
        resolutionMarshal := resolution is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetImageHorizontalResolution", "ptr", image_, resolutionMarshal, resolution, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<Float>} resolution 
     * @returns {Integer} 
     */
    static GdipGetImageVerticalResolution(image_, resolution) {
        resolutionMarshal := resolution is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetImageVerticalResolution", "ptr", image_, resolutionMarshal, resolution, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<Integer>} flags 
     * @returns {Integer} 
     */
    static GdipGetImageFlags(image_, flags) {
        flagsMarshal := flags is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetImageFlags", "ptr", image_, flagsMarshal, flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<Guid>} format 
     * @returns {Integer} 
     */
    static GdipGetImageRawFormat(image_, format) {
        result := DllCall("gdiplus.dll\GdipGetImageRawFormat", "ptr", image_, "ptr", format, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<Integer>} format 
     * @returns {Integer} 
     */
    static GdipGetImagePixelFormat(image_, format) {
        formatMarshal := format is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetImagePixelFormat", "ptr", image_, formatMarshal, format, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Integer} thumbWidth 
     * @param {Integer} thumbHeight 
     * @param {Pointer<Pointer<GpImage>>} thumbImage 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @returns {Integer} 
     */
    static GdipGetImageThumbnail(image_, thumbWidth, thumbHeight, thumbImage, callback, callbackData) {
        thumbImageMarshal := thumbImage is VarRef ? "ptr*" : "ptr"
        callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetImageThumbnail", "ptr", image_, "uint", thumbWidth, "uint", thumbHeight, thumbImageMarshal, thumbImage, "ptr", callback, callbackDataMarshal, callbackData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<Guid>} clsidEncoder 
     * @param {Pointer<Integer>} size_ 
     * @returns {Integer} 
     */
    static GdipGetEncoderParameterListSize(image_, clsidEncoder, size_) {
        size_Marshal := size_ is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetEncoderParameterListSize", "ptr", image_, "ptr", clsidEncoder, size_Marshal, size_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<Guid>} clsidEncoder 
     * @param {Integer} size_ 
     * @param {Pointer<EncoderParameters>} buffer_ 
     * @returns {Integer} 
     */
    static GdipGetEncoderParameterList(image_, clsidEncoder, size_, buffer_) {
        result := DllCall("gdiplus.dll\GdipGetEncoderParameterList", "ptr", image_, "ptr", clsidEncoder, "uint", size_, "ptr", buffer_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<Integer>} count 
     * @returns {Integer} 
     */
    static GdipImageGetFrameDimensionsCount(image_, count) {
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipImageGetFrameDimensionsCount", "ptr", image_, countMarshal, count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<Guid>} dimensionIDs 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipImageGetFrameDimensionsList(image_, dimensionIDs, count) {
        result := DllCall("gdiplus.dll\GdipImageGetFrameDimensionsList", "ptr", image_, "ptr", dimensionIDs, "uint", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<Guid>} dimensionID 
     * @param {Pointer<Integer>} count 
     * @returns {Integer} 
     */
    static GdipImageGetFrameCount(image_, dimensionID, count) {
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipImageGetFrameCount", "ptr", image_, "ptr", dimensionID, countMarshal, count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<Guid>} dimensionID 
     * @param {Integer} frameIndex 
     * @returns {Integer} 
     */
    static GdipImageSelectActiveFrame(image_, dimensionID, frameIndex) {
        result := DllCall("gdiplus.dll\GdipImageSelectActiveFrame", "ptr", image_, "ptr", dimensionID, "uint", frameIndex, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Integer} rfType 
     * @returns {Integer} 
     */
    static GdipImageRotateFlip(image_, rfType) {
        result := DllCall("gdiplus.dll\GdipImageRotateFlip", "ptr", image_, "int", rfType, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<ColorPalette>} palette 
     * @param {Integer} size_ 
     * @returns {Integer} 
     */
    static GdipGetImagePalette(image_, palette, size_) {
        result := DllCall("gdiplus.dll\GdipGetImagePalette", "ptr", image_, "ptr", palette, "int", size_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<ColorPalette>} palette 
     * @returns {Integer} 
     */
    static GdipSetImagePalette(image_, palette) {
        result := DllCall("gdiplus.dll\GdipSetImagePalette", "ptr", image_, "ptr", palette, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<Integer>} size_ 
     * @returns {Integer} 
     */
    static GdipGetImagePaletteSize(image_, size_) {
        size_Marshal := size_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetImagePaletteSize", "ptr", image_, size_Marshal, size_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<Integer>} numOfProperty 
     * @returns {Integer} 
     */
    static GdipGetPropertyCount(image_, numOfProperty) {
        numOfPropertyMarshal := numOfProperty is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPropertyCount", "ptr", image_, numOfPropertyMarshal, numOfProperty, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Integer} numOfProperty 
     * @param {Pointer<Integer>} list 
     * @returns {Integer} 
     */
    static GdipGetPropertyIdList(image_, numOfProperty, list) {
        listMarshal := list is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPropertyIdList", "ptr", image_, "uint", numOfProperty, listMarshal, list, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Integer} propId 
     * @param {Pointer<Integer>} size_ 
     * @returns {Integer} 
     */
    static GdipGetPropertyItemSize(image_, propId, size_) {
        size_Marshal := size_ is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPropertyItemSize", "ptr", image_, "uint", propId, size_Marshal, size_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Integer} propId 
     * @param {Integer} propSize 
     * @param {Pointer<PropertyItem>} buffer_ 
     * @returns {Integer} 
     */
    static GdipGetPropertyItem(image_, propId, propSize, buffer_) {
        result := DllCall("gdiplus.dll\GdipGetPropertyItem", "ptr", image_, "uint", propId, "uint", propSize, "ptr", buffer_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<Integer>} totalBufferSize 
     * @param {Pointer<Integer>} numProperties 
     * @returns {Integer} 
     */
    static GdipGetPropertySize(image_, totalBufferSize, numProperties) {
        totalBufferSizeMarshal := totalBufferSize is VarRef ? "uint*" : "ptr"
        numPropertiesMarshal := numProperties is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPropertySize", "ptr", image_, totalBufferSizeMarshal, totalBufferSize, numPropertiesMarshal, numProperties, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Integer} totalBufferSize 
     * @param {Integer} numProperties 
     * @param {Pointer<PropertyItem>} allItems 
     * @returns {Integer} 
     */
    static GdipGetAllPropertyItems(image_, totalBufferSize, numProperties, allItems) {
        result := DllCall("gdiplus.dll\GdipGetAllPropertyItems", "ptr", image_, "uint", totalBufferSize, "uint", numProperties, "ptr", allItems, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Integer} propId 
     * @returns {Integer} 
     */
    static GdipRemovePropertyItem(image_, propId) {
        result := DllCall("gdiplus.dll\GdipRemovePropertyItem", "ptr", image_, "uint", propId, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<PropertyItem>} item 
     * @returns {Integer} 
     */
    static GdipSetPropertyItem(image_, item) {
        result := DllCall("gdiplus.dll\GdipSetPropertyItem", "ptr", image_, "ptr", item, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<ImageItemData>} item 
     * @returns {Integer} 
     */
    static GdipFindFirstImageItem(image_, item) {
        result := DllCall("gdiplus.dll\GdipFindFirstImageItem", "ptr", image_, "ptr", item, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<ImageItemData>} item 
     * @returns {Integer} 
     */
    static GdipFindNextImageItem(image_, item) {
        result := DllCall("gdiplus.dll\GdipFindNextImageItem", "ptr", image_, "ptr", item, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<ImageItemData>} item 
     * @returns {Integer} 
     */
    static GdipGetImageItemData(image_, item) {
        result := DllCall("gdiplus.dll\GdipGetImageItemData", "ptr", image_, "ptr", item, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} image_ 
     * @returns {Integer} 
     */
    static GdipImageForceValidation(image_) {
        result := DllCall("gdiplus.dll\GdipImageForceValidation", "ptr", image_, "int")
        return result
    }

    /**
     * 
     * @param {IStream} stream 
     * @param {Pointer<Pointer<GpBitmap>>} bitmap_ 
     * @returns {Integer} 
     */
    static GdipCreateBitmapFromStream(stream, bitmap_) {
        bitmap_Marshal := bitmap_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateBitmapFromStream", "ptr", stream, bitmap_Marshal, bitmap_, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} filename 
     * @param {Pointer<Pointer<GpBitmap>>} bitmap_ 
     * @returns {Integer} 
     */
    static GdipCreateBitmapFromFile(filename, bitmap_) {
        filename := filename is String ? StrPtr(filename) : filename

        bitmap_Marshal := bitmap_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateBitmapFromFile", "ptr", filename, bitmap_Marshal, bitmap_, "int")
        return result
    }

    /**
     * 
     * @param {IStream} stream 
     * @param {Pointer<Pointer<GpBitmap>>} bitmap_ 
     * @returns {Integer} 
     */
    static GdipCreateBitmapFromStreamICM(stream, bitmap_) {
        bitmap_Marshal := bitmap_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateBitmapFromStreamICM", "ptr", stream, bitmap_Marshal, bitmap_, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} filename 
     * @param {Pointer<Pointer<GpBitmap>>} bitmap_ 
     * @returns {Integer} 
     */
    static GdipCreateBitmapFromFileICM(filename, bitmap_) {
        filename := filename is String ? StrPtr(filename) : filename

        bitmap_Marshal := bitmap_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateBitmapFromFileICM", "ptr", filename, bitmap_Marshal, bitmap_, "int")
        return result
    }

    /**
     * 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} stride 
     * @param {Integer} format 
     * @param {Pointer<Integer>} scan0 
     * @param {Pointer<Pointer<GpBitmap>>} bitmap_ 
     * @returns {Integer} 
     */
    static GdipCreateBitmapFromScan0(width, height, stride, format, scan0, bitmap_) {
        scan0Marshal := scan0 is VarRef ? "char*" : "ptr"
        bitmap_Marshal := bitmap_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateBitmapFromScan0", "int", width, "int", height, "int", stride, "int", format, scan0Marshal, scan0, bitmap_Marshal, bitmap_, "int")
        return result
    }

    /**
     * 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Pointer<GpGraphics>} target 
     * @param {Pointer<Pointer<GpBitmap>>} bitmap_ 
     * @returns {Integer} 
     */
    static GdipCreateBitmapFromGraphics(width, height, target, bitmap_) {
        bitmap_Marshal := bitmap_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateBitmapFromGraphics", "int", width, "int", height, "ptr", target, bitmap_Marshal, bitmap_, "int")
        return result
    }

    /**
     * 
     * @param {IDirectDrawSurface7} surface 
     * @param {Pointer<Pointer<GpBitmap>>} bitmap_ 
     * @returns {Integer} 
     */
    static GdipCreateBitmapFromDirectDrawSurface(surface, bitmap_) {
        bitmap_Marshal := bitmap_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateBitmapFromDirectDrawSurface", "ptr", surface, bitmap_Marshal, bitmap_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<BITMAPINFO>} gdiBitmapInfo 
     * @param {Pointer<Void>} gdiBitmapData 
     * @param {Pointer<Pointer<GpBitmap>>} bitmap_ 
     * @returns {Integer} 
     */
    static GdipCreateBitmapFromGdiDib(gdiBitmapInfo, gdiBitmapData, bitmap_) {
        gdiBitmapDataMarshal := gdiBitmapData is VarRef ? "ptr" : "ptr"
        bitmap_Marshal := bitmap_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateBitmapFromGdiDib", "ptr", gdiBitmapInfo, gdiBitmapDataMarshal, gdiBitmapData, bitmap_Marshal, bitmap_, "int")
        return result
    }

    /**
     * 
     * @param {HBITMAP} hbm_ 
     * @param {HPALETTE} hpal 
     * @param {Pointer<Pointer<GpBitmap>>} bitmap_ 
     * @returns {Integer} 
     */
    static GdipCreateBitmapFromHBITMAP(hbm_, hpal, bitmap_) {
        hbm_ := hbm_ is Win32Handle ? NumGet(hbm_, "ptr") : hbm_
        hpal := hpal is Win32Handle ? NumGet(hpal, "ptr") : hpal

        bitmap_Marshal := bitmap_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateBitmapFromHBITMAP", "ptr", hbm_, "ptr", hpal, bitmap_Marshal, bitmap_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBitmap>} bitmap_ 
     * @param {Pointer<HBITMAP>} hbmReturn 
     * @param {Integer} background 
     * @returns {Integer} 
     */
    static GdipCreateHBITMAPFromBitmap(bitmap_, hbmReturn, background) {
        result := DllCall("gdiplus.dll\GdipCreateHBITMAPFromBitmap", "ptr", bitmap_, "ptr", hbmReturn, "uint", background, "int")
        return result
    }

    /**
     * 
     * @param {HICON} hicon_ 
     * @param {Pointer<Pointer<GpBitmap>>} bitmap_ 
     * @returns {Integer} 
     */
    static GdipCreateBitmapFromHICON(hicon_, bitmap_) {
        hicon_ := hicon_ is Win32Handle ? NumGet(hicon_, "ptr") : hicon_

        bitmap_Marshal := bitmap_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateBitmapFromHICON", "ptr", hicon_, bitmap_Marshal, bitmap_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBitmap>} bitmap_ 
     * @param {Pointer<HICON>} hbmReturn 
     * @returns {Integer} 
     */
    static GdipCreateHICONFromBitmap(bitmap_, hbmReturn) {
        result := DllCall("gdiplus.dll\GdipCreateHICONFromBitmap", "ptr", bitmap_, "ptr", hbmReturn, "int")
        return result
    }

    /**
     * 
     * @param {HINSTANCE} hInstance_ 
     * @param {PWSTR} lpBitmapName 
     * @param {Pointer<Pointer<GpBitmap>>} bitmap_ 
     * @returns {Integer} 
     */
    static GdipCreateBitmapFromResource(hInstance_, lpBitmapName, bitmap_) {
        hInstance_ := hInstance_ is Win32Handle ? NumGet(hInstance_, "ptr") : hInstance_
        lpBitmapName := lpBitmapName is String ? StrPtr(lpBitmapName) : lpBitmapName

        bitmap_Marshal := bitmap_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateBitmapFromResource", "ptr", hInstance_, "ptr", lpBitmapName, bitmap_Marshal, bitmap_, "int")
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
     * @param {Pointer<Pointer<GpBitmap>>} dstBitmap 
     * @returns {Integer} 
     */
    static GdipCloneBitmapArea(x, y, width, height, format, srcBitmap, dstBitmap) {
        dstBitmapMarshal := dstBitmap is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCloneBitmapArea", "float", x, "float", y, "float", width, "float", height, "int", format, "ptr", srcBitmap, dstBitmapMarshal, dstBitmap, "int")
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
     * @param {Pointer<Pointer<GpBitmap>>} dstBitmap 
     * @returns {Integer} 
     */
    static GdipCloneBitmapAreaI(x, y, width, height, format, srcBitmap, dstBitmap) {
        dstBitmapMarshal := dstBitmap is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCloneBitmapAreaI", "int", x, "int", y, "int", width, "int", height, "int", format, "ptr", srcBitmap, dstBitmapMarshal, dstBitmap, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBitmap>} bitmap_ 
     * @param {Pointer<Rect>} rect_ 
     * @param {Integer} flags 
     * @param {Integer} format 
     * @param {Pointer<BitmapData>} lockedBitmapData 
     * @returns {Integer} 
     */
    static GdipBitmapLockBits(bitmap_, rect_, flags, format, lockedBitmapData) {
        result := DllCall("gdiplus.dll\GdipBitmapLockBits", "ptr", bitmap_, "ptr", rect_, "uint", flags, "int", format, "ptr", lockedBitmapData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBitmap>} bitmap_ 
     * @param {Pointer<BitmapData>} lockedBitmapData 
     * @returns {Integer} 
     */
    static GdipBitmapUnlockBits(bitmap_, lockedBitmapData) {
        result := DllCall("gdiplus.dll\GdipBitmapUnlockBits", "ptr", bitmap_, "ptr", lockedBitmapData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBitmap>} bitmap_ 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Pointer<Integer>} color_ 
     * @returns {Integer} 
     */
    static GdipBitmapGetPixel(bitmap_, x, y, color_) {
        color_Marshal := color_ is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipBitmapGetPixel", "ptr", bitmap_, "int", x, "int", y, color_Marshal, color_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBitmap>} bitmap_ 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} color_ 
     * @returns {Integer} 
     */
    static GdipBitmapSetPixel(bitmap_, x, y, color_) {
        result := DllCall("gdiplus.dll\GdipBitmapSetPixel", "ptr", bitmap_, "int", x, "int", y, "uint", color_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImage>} pImage 
     * @param {GdiplusAbort} pIAbort 
     * @returns {Integer} 
     */
    static GdipImageSetAbort(pImage, pIAbort) {
        result := DllCall("gdiplus.dll\GdipImageSetAbort", "ptr", pImage, "ptr", pIAbort, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} pGraphics 
     * @param {GdiplusAbort} pIAbort 
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
     * @param {Integer} dithertype_ 
     * @param {Integer} palettetype_ 
     * @param {Pointer<ColorPalette>} palette 
     * @param {Float} alphaThresholdPercent 
     * @returns {Integer} 
     */
    static GdipBitmapConvertFormat(pInputBitmap, format, dithertype_, palettetype_, palette, alphaThresholdPercent) {
        result := DllCall("gdiplus.dll\GdipBitmapConvertFormat", "ptr", pInputBitmap, "int", format, "int", dithertype_, "int", palettetype_, "ptr", palette, "float", alphaThresholdPercent, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ColorPalette>} palette 
     * @param {Integer} palettetype_ 
     * @param {Integer} optimalColors 
     * @param {BOOL} useTransparentColor 
     * @param {Pointer<GpBitmap>} bitmap_ 
     * @returns {Integer} 
     */
    static GdipInitializePalette(palette, palettetype_, optimalColors, useTransparentColor, bitmap_) {
        result := DllCall("gdiplus.dll\GdipInitializePalette", "ptr", palette, "int", palettetype_, "int", optimalColors, "int", useTransparentColor, "ptr", bitmap_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBitmap>} bitmap_ 
     * @param {Pointer<CGpEffect>} effect_ 
     * @param {Pointer<RECT>} roi 
     * @param {BOOL} useAuxData 
     * @param {Pointer<Pointer<Void>>} auxData 
     * @param {Pointer<Integer>} auxDataSize 
     * @returns {Integer} 
     */
    static GdipBitmapApplyEffect(bitmap_, effect_, roi, useAuxData, auxData, auxDataSize) {
        auxDataMarshal := auxData is VarRef ? "ptr*" : "ptr"
        auxDataSizeMarshal := auxDataSize is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipBitmapApplyEffect", "ptr", bitmap_, "ptr", effect_, "ptr", roi, "int", useAuxData, auxDataMarshal, auxData, auxDataSizeMarshal, auxDataSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<GpBitmap>>} inputBitmaps 
     * @param {Integer} numInputs 
     * @param {Pointer<CGpEffect>} effect_ 
     * @param {Pointer<RECT>} roi 
     * @param {Pointer<RECT>} outputRect 
     * @param {Pointer<Pointer<GpBitmap>>} outputBitmap 
     * @param {BOOL} useAuxData 
     * @param {Pointer<Pointer<Void>>} auxData 
     * @param {Pointer<Integer>} auxDataSize 
     * @returns {Integer} 
     */
    static GdipBitmapCreateApplyEffect(inputBitmaps, numInputs, effect_, roi, outputRect, outputBitmap, useAuxData, auxData, auxDataSize) {
        inputBitmapsMarshal := inputBitmaps is VarRef ? "ptr*" : "ptr"
        outputBitmapMarshal := outputBitmap is VarRef ? "ptr*" : "ptr"
        auxDataMarshal := auxData is VarRef ? "ptr*" : "ptr"
        auxDataSizeMarshal := auxDataSize is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipBitmapCreateApplyEffect", inputBitmapsMarshal, inputBitmaps, "int", numInputs, "ptr", effect_, "ptr", roi, "ptr", outputRect, outputBitmapMarshal, outputBitmap, "int", useAuxData, auxDataMarshal, auxData, auxDataSizeMarshal, auxDataSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBitmap>} bitmap_ 
     * @param {Integer} format 
     * @param {Integer} NumberOfEntries 
     * @param {Pointer<Integer>} channel0 
     * @param {Pointer<Integer>} channel1 
     * @param {Pointer<Integer>} channel2 
     * @param {Pointer<Integer>} channel3 
     * @returns {Integer} 
     */
    static GdipBitmapGetHistogram(bitmap_, format, NumberOfEntries, channel0, channel1, channel2, channel3) {
        channel0Marshal := channel0 is VarRef ? "uint*" : "ptr"
        channel1Marshal := channel1 is VarRef ? "uint*" : "ptr"
        channel2Marshal := channel2 is VarRef ? "uint*" : "ptr"
        channel3Marshal := channel3 is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipBitmapGetHistogram", "ptr", bitmap_, "int", format, "uint", NumberOfEntries, channel0Marshal, channel0, channel1Marshal, channel1, channel2Marshal, channel2, channel3Marshal, channel3, "int")
        return result
    }

    /**
     * 
     * @param {Integer} format 
     * @param {Pointer<Integer>} NumberOfEntries 
     * @returns {Integer} 
     */
    static GdipBitmapGetHistogramSize(format, NumberOfEntries) {
        NumberOfEntriesMarshal := NumberOfEntries is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipBitmapGetHistogramSize", "int", format, NumberOfEntriesMarshal, NumberOfEntries, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpBitmap>} bitmap_ 
     * @param {Float} xdpi 
     * @param {Float} ydpi 
     * @returns {Integer} 
     */
    static GdipBitmapSetResolution(bitmap_, xdpi, ydpi) {
        result := DllCall("gdiplus.dll\GdipBitmapSetResolution", "ptr", bitmap_, "float", xdpi, "float", ydpi, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<GpImageAttributes>>} imageattr 
     * @returns {Integer} 
     */
    static GdipCreateImageAttributes(imageattr) {
        imageattrMarshal := imageattr is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateImageAttributes", imageattrMarshal, imageattr, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpImageAttributes>} imageattr 
     * @param {Pointer<Pointer<GpImageAttributes>>} cloneImageattr 
     * @returns {Integer} 
     */
    static GdipCloneImageAttributes(imageattr, cloneImageattr) {
        cloneImageattrMarshal := cloneImageattr is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCloneImageAttributes", "ptr", imageattr, cloneImageattrMarshal, cloneImageattr, "int")
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
     * @param {Pointer<ColorMatrix>} colorMatrix_ 
     * @param {Pointer<ColorMatrix>} grayMatrix 
     * @param {Integer} flags 
     * @returns {Integer} 
     */
    static GdipSetImageAttributesColorMatrix(imageattr, type, enableFlag, colorMatrix_, grayMatrix, flags) {
        result := DllCall("gdiplus.dll\GdipSetImageAttributesColorMatrix", "ptr", imageattr, "int", type, "int", enableFlag, "ptr", colorMatrix_, "ptr", grayMatrix, "int", flags, "int")
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
     * @param {Pointer<ColorPalette>} colorPalette_ 
     * @param {Integer} colorAdjustType_ 
     * @returns {Integer} 
     */
    static GdipGetImageAttributesAdjustedPalette(imageAttr, colorPalette_, colorAdjustType_) {
        result := DllCall("gdiplus.dll\GdipGetImageAttributesAdjustedPalette", "ptr", imageAttr, "ptr", colorPalette_, "int", colorAdjustType_, "int")
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
     * @param {HDC} hdc_ 
     * @param {Pointer<Pointer<GpGraphics>>} graphics 
     * @returns {Integer} 
     */
    static GdipCreateFromHDC(hdc_, graphics) {
        hdc_ := hdc_ is Win32Handle ? NumGet(hdc_, "ptr") : hdc_

        graphicsMarshal := graphics is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateFromHDC", "ptr", hdc_, graphicsMarshal, graphics, "int")
        return result
    }

    /**
     * 
     * @param {HDC} hdc_ 
     * @param {HANDLE} hDevice 
     * @param {Pointer<Pointer<GpGraphics>>} graphics 
     * @returns {Integer} 
     */
    static GdipCreateFromHDC2(hdc_, hDevice, graphics) {
        hdc_ := hdc_ is Win32Handle ? NumGet(hdc_, "ptr") : hdc_
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        graphicsMarshal := graphics is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateFromHDC2", "ptr", hdc_, "ptr", hDevice, graphicsMarshal, graphics, "int")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd_ 
     * @param {Pointer<Pointer<GpGraphics>>} graphics 
     * @returns {Integer} 
     */
    static GdipCreateFromHWND(hwnd_, graphics) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        graphicsMarshal := graphics is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateFromHWND", "ptr", hwnd_, graphicsMarshal, graphics, "int")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd_ 
     * @param {Pointer<Pointer<GpGraphics>>} graphics 
     * @returns {Integer} 
     */
    static GdipCreateFromHWNDICM(hwnd_, graphics) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        graphicsMarshal := graphics is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateFromHWNDICM", "ptr", hwnd_, graphicsMarshal, graphics, "int")
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
     * @param {Pointer<HDC>} hdc_ 
     * @returns {Integer} 
     */
    static GdipGetDC(graphics, hdc_) {
        result := DllCall("gdiplus.dll\GdipGetDC", "ptr", graphics, "ptr", hdc_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {HDC} hdc_ 
     * @returns {Integer} 
     */
    static GdipReleaseDC(graphics, hdc_) {
        hdc_ := hdc_ is Win32Handle ? NumGet(hdc_, "ptr") : hdc_

        result := DllCall("gdiplus.dll\GdipReleaseDC", "ptr", graphics, "ptr", hdc_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} compositingMode_ 
     * @returns {Integer} 
     */
    static GdipSetCompositingMode(graphics, compositingMode_) {
        result := DllCall("gdiplus.dll\GdipSetCompositingMode", "ptr", graphics, "int", compositingMode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Integer>} compositingMode_ 
     * @returns {Integer} 
     */
    static GdipGetCompositingMode(graphics, compositingMode_) {
        compositingMode_Marshal := compositingMode_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetCompositingMode", "ptr", graphics, compositingMode_Marshal, compositingMode_, "int")
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
     * @param {Pointer<Integer>} x 
     * @param {Pointer<Integer>} y 
     * @returns {Integer} 
     */
    static GdipGetRenderingOrigin(graphics, x, y) {
        xMarshal := x is VarRef ? "int*" : "ptr"
        yMarshal := y is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetRenderingOrigin", "ptr", graphics, xMarshal, x, yMarshal, y, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} compositingQuality_ 
     * @returns {Integer} 
     */
    static GdipSetCompositingQuality(graphics, compositingQuality_) {
        result := DllCall("gdiplus.dll\GdipSetCompositingQuality", "ptr", graphics, "int", compositingQuality_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Integer>} compositingQuality_ 
     * @returns {Integer} 
     */
    static GdipGetCompositingQuality(graphics, compositingQuality_) {
        compositingQuality_Marshal := compositingQuality_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetCompositingQuality", "ptr", graphics, compositingQuality_Marshal, compositingQuality_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} smoothingMode_ 
     * @returns {Integer} 
     */
    static GdipSetSmoothingMode(graphics, smoothingMode_) {
        result := DllCall("gdiplus.dll\GdipSetSmoothingMode", "ptr", graphics, "int", smoothingMode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Integer>} smoothingMode_ 
     * @returns {Integer} 
     */
    static GdipGetSmoothingMode(graphics, smoothingMode_) {
        smoothingMode_Marshal := smoothingMode_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetSmoothingMode", "ptr", graphics, smoothingMode_Marshal, smoothingMode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} pixelOffsetMode_ 
     * @returns {Integer} 
     */
    static GdipSetPixelOffsetMode(graphics, pixelOffsetMode_) {
        result := DllCall("gdiplus.dll\GdipSetPixelOffsetMode", "ptr", graphics, "int", pixelOffsetMode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Integer>} pixelOffsetMode_ 
     * @returns {Integer} 
     */
    static GdipGetPixelOffsetMode(graphics, pixelOffsetMode_) {
        pixelOffsetMode_Marshal := pixelOffsetMode_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPixelOffsetMode", "ptr", graphics, pixelOffsetMode_Marshal, pixelOffsetMode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} mode_ 
     * @returns {Integer} 
     */
    static GdipSetTextRenderingHint(graphics, mode_) {
        result := DllCall("gdiplus.dll\GdipSetTextRenderingHint", "ptr", graphics, "int", mode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Integer>} mode_ 
     * @returns {Integer} 
     */
    static GdipGetTextRenderingHint(graphics, mode_) {
        mode_Marshal := mode_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetTextRenderingHint", "ptr", graphics, mode_Marshal, mode_, "int")
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
     * @param {Pointer<Integer>} contrast 
     * @returns {Integer} 
     */
    static GdipGetTextContrast(graphics, contrast) {
        contrastMarshal := contrast is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetTextContrast", "ptr", graphics, contrastMarshal, contrast, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} interpolationMode_ 
     * @returns {Integer} 
     */
    static GdipSetInterpolationMode(graphics, interpolationMode_) {
        result := DllCall("gdiplus.dll\GdipSetInterpolationMode", "ptr", graphics, "int", interpolationMode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Integer>} interpolationMode_ 
     * @returns {Integer} 
     */
    static GdipGetInterpolationMode(graphics, interpolationMode_) {
        interpolationMode_Marshal := interpolationMode_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetInterpolationMode", "ptr", graphics, interpolationMode_Marshal, interpolationMode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Matrix>} matrix_ 
     * @returns {Integer} 
     */
    static GdipSetWorldTransform(graphics, matrix_) {
        result := DllCall("gdiplus.dll\GdipSetWorldTransform", "ptr", graphics, "ptr", matrix_, "int")
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
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Integer} order 
     * @returns {Integer} 
     */
    static GdipMultiplyWorldTransform(graphics, matrix_, order) {
        result := DllCall("gdiplus.dll\GdipMultiplyWorldTransform", "ptr", graphics, "ptr", matrix_, "int", order, "int")
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
     * @param {Pointer<Matrix>} matrix_ 
     * @returns {Integer} 
     */
    static GdipGetWorldTransform(graphics, matrix_) {
        result := DllCall("gdiplus.dll\GdipGetWorldTransform", "ptr", graphics, "ptr", matrix_, "int")
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
     * @param {Pointer<Integer>} unit_ 
     * @returns {Integer} 
     */
    static GdipGetPageUnit(graphics, unit_) {
        unit_Marshal := unit_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPageUnit", "ptr", graphics, unit_Marshal, unit_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Float>} scale 
     * @returns {Integer} 
     */
    static GdipGetPageScale(graphics, scale) {
        scaleMarshal := scale is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetPageScale", "ptr", graphics, scaleMarshal, scale, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} unit_ 
     * @returns {Integer} 
     */
    static GdipSetPageUnit(graphics, unit_) {
        result := DllCall("gdiplus.dll\GdipSetPageUnit", "ptr", graphics, "int", unit_, "int")
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
     * @param {Pointer<Float>} dpi 
     * @returns {Integer} 
     */
    static GdipGetDpiX(graphics, dpi) {
        dpiMarshal := dpi is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetDpiX", "ptr", graphics, dpiMarshal, dpi, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Float>} dpi 
     * @returns {Integer} 
     */
    static GdipGetDpiY(graphics, dpi) {
        dpiMarshal := dpi is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetDpiY", "ptr", graphics, dpiMarshal, dpi, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} destSpace 
     * @param {Integer} srcSpace 
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipTransformPoints(graphics, destSpace, srcSpace, points_, count) {
        result := DllCall("gdiplus.dll\GdipTransformPoints", "ptr", graphics, "int", destSpace, "int", srcSpace, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} destSpace 
     * @param {Integer} srcSpace 
     * @param {Pointer<Point>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipTransformPointsI(graphics, destSpace, srcSpace, points_, count) {
        result := DllCall("gdiplus.dll\GdipTransformPointsI", "ptr", graphics, "int", destSpace, "int", srcSpace, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Integer>} argb 
     * @returns {Integer} 
     */
    static GdipGetNearestColor(graphics, argb) {
        argbMarshal := argb is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetNearestColor", "ptr", graphics, argbMarshal, argb, "int")
        return result
    }

    /**
     * 
     * @returns {HPALETTE} 
     */
    static GdipCreateHalftonePalette() {
        result := DllCall("gdiplus.dll\GdipCreateHalftonePalette", "ptr")
        resultHandle := HPALETTE({Value: result}, True)
        return resultHandle
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
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawLines(graphics, pen, points_, count) {
        result := DllCall("gdiplus.dll\GdipDrawLines", "ptr", graphics, "ptr", pen, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Point>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawLinesI(graphics, pen, points_, count) {
        result := DllCall("gdiplus.dll\GdipDrawLinesI", "ptr", graphics, "ptr", pen, "ptr", points_, "int", count, "int")
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
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawBeziers(graphics, pen, points_, count) {
        result := DllCall("gdiplus.dll\GdipDrawBeziers", "ptr", graphics, "ptr", pen, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Point>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawBeziersI(graphics, pen, points_, count) {
        result := DllCall("gdiplus.dll\GdipDrawBeziersI", "ptr", graphics, "ptr", pen, "ptr", points_, "int", count, "int")
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
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawPolygon(graphics, pen, points_, count) {
        result := DllCall("gdiplus.dll\GdipDrawPolygon", "ptr", graphics, "ptr", pen, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Point>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawPolygonI(graphics, pen, points_, count) {
        result := DllCall("gdiplus.dll\GdipDrawPolygonI", "ptr", graphics, "ptr", pen, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<GpPath>} path_ 
     * @returns {Integer} 
     */
    static GdipDrawPath(graphics, pen, path_) {
        result := DllCall("gdiplus.dll\GdipDrawPath", "ptr", graphics, "ptr", pen, "ptr", path_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawCurve(graphics, pen, points_, count) {
        result := DllCall("gdiplus.dll\GdipDrawCurve", "ptr", graphics, "ptr", pen, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Point>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawCurveI(graphics, pen, points_, count) {
        result := DllCall("gdiplus.dll\GdipDrawCurveI", "ptr", graphics, "ptr", pen, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipDrawCurve2(graphics, pen, points_, count, tension) {
        result := DllCall("gdiplus.dll\GdipDrawCurve2", "ptr", graphics, "ptr", pen, "ptr", points_, "int", count, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Point>} points_ 
     * @param {Integer} count 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipDrawCurve2I(graphics, pen, points_, count, tension) {
        result := DllCall("gdiplus.dll\GdipDrawCurve2I", "ptr", graphics, "ptr", pen, "ptr", points_, "int", count, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @param {Integer} offset 
     * @param {Integer} numberOfSegments 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipDrawCurve3(graphics, pen, points_, count, offset, numberOfSegments, tension) {
        result := DllCall("gdiplus.dll\GdipDrawCurve3", "ptr", graphics, "ptr", pen, "ptr", points_, "int", count, "int", offset, "int", numberOfSegments, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Point>} points_ 
     * @param {Integer} count 
     * @param {Integer} offset 
     * @param {Integer} numberOfSegments 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipDrawCurve3I(graphics, pen, points_, count, offset, numberOfSegments, tension) {
        result := DllCall("gdiplus.dll\GdipDrawCurve3I", "ptr", graphics, "ptr", pen, "ptr", points_, "int", count, "int", offset, "int", numberOfSegments, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawClosedCurve(graphics, pen, points_, count) {
        result := DllCall("gdiplus.dll\GdipDrawClosedCurve", "ptr", graphics, "ptr", pen, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Point>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawClosedCurveI(graphics, pen, points_, count) {
        result := DllCall("gdiplus.dll\GdipDrawClosedCurveI", "ptr", graphics, "ptr", pen, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipDrawClosedCurve2(graphics, pen, points_, count, tension) {
        result := DllCall("gdiplus.dll\GdipDrawClosedCurve2", "ptr", graphics, "ptr", pen, "ptr", points_, "int", count, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPen>} pen 
     * @param {Pointer<Point>} points_ 
     * @param {Integer} count 
     * @param {Float} tension 
     * @returns {Integer} 
     */
    static GdipDrawClosedCurve2I(graphics, pen, points_, count, tension) {
        result := DllCall("gdiplus.dll\GdipDrawClosedCurve2I", "ptr", graphics, "ptr", pen, "ptr", points_, "int", count, "float", tension, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} color_ 
     * @returns {Integer} 
     */
    static GdipGraphicsClear(graphics, color_) {
        result := DllCall("gdiplus.dll\GdipGraphicsClear", "ptr", graphics, "uint", color_, "int")
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
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @param {Integer} fillMode_ 
     * @returns {Integer} 
     */
    static GdipFillPolygon(graphics, brush, points_, count, fillMode_) {
        result := DllCall("gdiplus.dll\GdipFillPolygon", "ptr", graphics, "ptr", brush, "ptr", points_, "int", count, "int", fillMode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<Point>} points_ 
     * @param {Integer} count 
     * @param {Integer} fillMode_ 
     * @returns {Integer} 
     */
    static GdipFillPolygonI(graphics, brush, points_, count, fillMode_) {
        result := DllCall("gdiplus.dll\GdipFillPolygonI", "ptr", graphics, "ptr", brush, "ptr", points_, "int", count, "int", fillMode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipFillPolygon2(graphics, brush, points_, count) {
        result := DllCall("gdiplus.dll\GdipFillPolygon2", "ptr", graphics, "ptr", brush, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<Point>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipFillPolygon2I(graphics, brush, points_, count) {
        result := DllCall("gdiplus.dll\GdipFillPolygon2I", "ptr", graphics, "ptr", brush, "ptr", points_, "int", count, "int")
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
     * @param {Pointer<GpPath>} path_ 
     * @returns {Integer} 
     */
    static GdipFillPath(graphics, brush, path_) {
        result := DllCall("gdiplus.dll\GdipFillPath", "ptr", graphics, "ptr", brush, "ptr", path_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipFillClosedCurve(graphics, brush, points_, count) {
        result := DllCall("gdiplus.dll\GdipFillClosedCurve", "ptr", graphics, "ptr", brush, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<Point>} points_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipFillClosedCurveI(graphics, brush, points_, count) {
        result := DllCall("gdiplus.dll\GdipFillClosedCurveI", "ptr", graphics, "ptr", brush, "ptr", points_, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<PointF>} points_ 
     * @param {Integer} count 
     * @param {Float} tension 
     * @param {Integer} fillMode_ 
     * @returns {Integer} 
     */
    static GdipFillClosedCurve2(graphics, brush, points_, count, tension, fillMode_) {
        result := DllCall("gdiplus.dll\GdipFillClosedCurve2", "ptr", graphics, "ptr", brush, "ptr", points_, "int", count, "float", tension, "int", fillMode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<Point>} points_ 
     * @param {Integer} count 
     * @param {Float} tension 
     * @param {Integer} fillMode_ 
     * @returns {Integer} 
     */
    static GdipFillClosedCurve2I(graphics, brush, points_, count, tension, fillMode_) {
        result := DllCall("gdiplus.dll\GdipFillClosedCurve2I", "ptr", graphics, "ptr", brush, "ptr", points_, "int", count, "float", tension, "int", fillMode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<GpRegion>} region_ 
     * @returns {Integer} 
     */
    static GdipFillRegion(graphics, brush, region_) {
        result := DllCall("gdiplus.dll\GdipFillRegion", "ptr", graphics, "ptr", brush, "ptr", region_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<RectF>} source 
     * @param {Pointer<Matrix>} xForm_ 
     * @param {Pointer<CGpEffect>} effect_ 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @param {Integer} srcUnit 
     * @returns {Integer} 
     */
    static GdipDrawImageFX(graphics, image_, source, xForm_, effect_, imageAttributes, srcUnit) {
        result := DllCall("gdiplus.dll\GdipDrawImageFX", "ptr", graphics, "ptr", image_, "ptr", source, "ptr", xForm_, "ptr", effect_, "ptr", imageAttributes, "int", srcUnit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image_ 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {Integer} 
     */
    static GdipDrawImage(graphics, image_, x, y) {
        result := DllCall("gdiplus.dll\GdipDrawImage", "ptr", graphics, "ptr", image_, "float", x, "float", y, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image_ 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {Integer} 
     */
    static GdipDrawImageI(graphics, image_, x, y) {
        result := DllCall("gdiplus.dll\GdipDrawImageI", "ptr", graphics, "ptr", image_, "int", x, "int", y, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image_ 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @returns {Integer} 
     */
    static GdipDrawImageRect(graphics, image_, x, y, width, height) {
        result := DllCall("gdiplus.dll\GdipDrawImageRect", "ptr", graphics, "ptr", image_, "float", x, "float", y, "float", width, "float", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image_ 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {Integer} 
     */
    static GdipDrawImageRectI(graphics, image_, x, y, width, height) {
        result := DllCall("gdiplus.dll\GdipDrawImageRectI", "ptr", graphics, "ptr", image_, "int", x, "int", y, "int", width, "int", height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<PointF>} dstpoints 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawImagePoints(graphics, image_, dstpoints, count) {
        result := DllCall("gdiplus.dll\GdipDrawImagePoints", "ptr", graphics, "ptr", image_, "ptr", dstpoints, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<Point>} dstpoints 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    static GdipDrawImagePointsI(graphics, image_, dstpoints, count) {
        result := DllCall("gdiplus.dll\GdipDrawImagePointsI", "ptr", graphics, "ptr", image_, "ptr", dstpoints, "int", count, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image_ 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} srcx 
     * @param {Float} srcy 
     * @param {Float} srcwidth 
     * @param {Float} srcheight 
     * @param {Integer} srcUnit 
     * @returns {Integer} 
     */
    static GdipDrawImagePointRect(graphics, image_, x, y, srcx, srcy, srcwidth, srcheight, srcUnit) {
        result := DllCall("gdiplus.dll\GdipDrawImagePointRect", "ptr", graphics, "ptr", image_, "float", x, "float", y, "float", srcx, "float", srcy, "float", srcwidth, "float", srcheight, "int", srcUnit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image_ 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} srcx 
     * @param {Integer} srcy 
     * @param {Integer} srcwidth 
     * @param {Integer} srcheight 
     * @param {Integer} srcUnit 
     * @returns {Integer} 
     */
    static GdipDrawImagePointRectI(graphics, image_, x, y, srcx, srcy, srcwidth, srcheight, srcUnit) {
        result := DllCall("gdiplus.dll\GdipDrawImagePointRectI", "ptr", graphics, "ptr", image_, "int", x, "int", y, "int", srcx, "int", srcy, "int", srcwidth, "int", srcheight, "int", srcUnit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image_ 
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
    static GdipDrawImageRectRect(graphics, image_, dstx, dsty, dstwidth, dstheight, srcx, srcy, srcwidth, srcheight, srcUnit, imageAttributes, callback, callbackData) {
        callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

        result := DllCall("gdiplus.dll\GdipDrawImageRectRect", "ptr", graphics, "ptr", image_, "float", dstx, "float", dsty, "float", dstwidth, "float", dstheight, "float", srcx, "float", srcy, "float", srcwidth, "float", srcheight, "int", srcUnit, "ptr", imageAttributes, "ptr", callback, callbackDataMarshal, callbackData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image_ 
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
    static GdipDrawImageRectRectI(graphics, image_, dstx, dsty, dstwidth, dstheight, srcx, srcy, srcwidth, srcheight, srcUnit, imageAttributes, callback, callbackData) {
        callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

        result := DllCall("gdiplus.dll\GdipDrawImageRectRectI", "ptr", graphics, "ptr", image_, "int", dstx, "int", dsty, "int", dstwidth, "int", dstheight, "int", srcx, "int", srcy, "int", srcwidth, "int", srcheight, "int", srcUnit, "ptr", imageAttributes, "ptr", callback, callbackDataMarshal, callbackData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<PointF>} points_ 
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
    static GdipDrawImagePointsRect(graphics, image_, points_, count, srcx, srcy, srcwidth, srcheight, srcUnit, imageAttributes, callback, callbackData) {
        callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

        result := DllCall("gdiplus.dll\GdipDrawImagePointsRect", "ptr", graphics, "ptr", image_, "ptr", points_, "int", count, "float", srcx, "float", srcy, "float", srcwidth, "float", srcheight, "int", srcUnit, "ptr", imageAttributes, "ptr", callback, callbackDataMarshal, callbackData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpImage>} image_ 
     * @param {Pointer<Point>} points_ 
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
    static GdipDrawImagePointsRectI(graphics, image_, points_, count, srcx, srcy, srcwidth, srcheight, srcUnit, imageAttributes, callback, callbackData) {
        callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

        result := DllCall("gdiplus.dll\GdipDrawImagePointsRectI", "ptr", graphics, "ptr", image_, "ptr", points_, "int", count, "int", srcx, "int", srcy, "int", srcwidth, "int", srcheight, "int", srcUnit, "ptr", imageAttributes, "ptr", callback, callbackDataMarshal, callbackData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile_ 
     * @param {Pointer<PointF>} destPoint 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileDestPoint(graphics, metafile_, destPoint, callback, callbackData, imageAttributes) {
        callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

        result := DllCall("gdiplus.dll\GdipEnumerateMetafileDestPoint", "ptr", graphics, "ptr", metafile_, "ptr", destPoint, "ptr", callback, callbackDataMarshal, callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile_ 
     * @param {Pointer<Point>} destPoint 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileDestPointI(graphics, metafile_, destPoint, callback, callbackData, imageAttributes) {
        callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

        result := DllCall("gdiplus.dll\GdipEnumerateMetafileDestPointI", "ptr", graphics, "ptr", metafile_, "ptr", destPoint, "ptr", callback, callbackDataMarshal, callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile_ 
     * @param {Pointer<RectF>} destRect 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileDestRect(graphics, metafile_, destRect, callback, callbackData, imageAttributes) {
        callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

        result := DllCall("gdiplus.dll\GdipEnumerateMetafileDestRect", "ptr", graphics, "ptr", metafile_, "ptr", destRect, "ptr", callback, callbackDataMarshal, callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile_ 
     * @param {Pointer<Rect>} destRect 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileDestRectI(graphics, metafile_, destRect, callback, callbackData, imageAttributes) {
        callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

        result := DllCall("gdiplus.dll\GdipEnumerateMetafileDestRectI", "ptr", graphics, "ptr", metafile_, "ptr", destRect, "ptr", callback, callbackDataMarshal, callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile_ 
     * @param {Pointer<PointF>} destPoints 
     * @param {Integer} count 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileDestPoints(graphics, metafile_, destPoints, count, callback, callbackData, imageAttributes) {
        callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

        result := DllCall("gdiplus.dll\GdipEnumerateMetafileDestPoints", "ptr", graphics, "ptr", metafile_, "ptr", destPoints, "int", count, "ptr", callback, callbackDataMarshal, callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile_ 
     * @param {Pointer<Point>} destPoints 
     * @param {Integer} count 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileDestPointsI(graphics, metafile_, destPoints, count, callback, callbackData, imageAttributes) {
        callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

        result := DllCall("gdiplus.dll\GdipEnumerateMetafileDestPointsI", "ptr", graphics, "ptr", metafile_, "ptr", destPoints, "int", count, "ptr", callback, callbackDataMarshal, callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile_ 
     * @param {Pointer<PointF>} destPoint 
     * @param {Pointer<RectF>} srcRect 
     * @param {Integer} srcUnit 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileSrcRectDestPoint(graphics, metafile_, destPoint, srcRect, srcUnit, callback, callbackData, imageAttributes) {
        callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

        result := DllCall("gdiplus.dll\GdipEnumerateMetafileSrcRectDestPoint", "ptr", graphics, "ptr", metafile_, "ptr", destPoint, "ptr", srcRect, "int", srcUnit, "ptr", callback, callbackDataMarshal, callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile_ 
     * @param {Pointer<Point>} destPoint 
     * @param {Pointer<Rect>} srcRect 
     * @param {Integer} srcUnit 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileSrcRectDestPointI(graphics, metafile_, destPoint, srcRect, srcUnit, callback, callbackData, imageAttributes) {
        callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

        result := DllCall("gdiplus.dll\GdipEnumerateMetafileSrcRectDestPointI", "ptr", graphics, "ptr", metafile_, "ptr", destPoint, "ptr", srcRect, "int", srcUnit, "ptr", callback, callbackDataMarshal, callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile_ 
     * @param {Pointer<RectF>} destRect 
     * @param {Pointer<RectF>} srcRect 
     * @param {Integer} srcUnit 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileSrcRectDestRect(graphics, metafile_, destRect, srcRect, srcUnit, callback, callbackData, imageAttributes) {
        callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

        result := DllCall("gdiplus.dll\GdipEnumerateMetafileSrcRectDestRect", "ptr", graphics, "ptr", metafile_, "ptr", destRect, "ptr", srcRect, "int", srcUnit, "ptr", callback, callbackDataMarshal, callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile_ 
     * @param {Pointer<Rect>} destRect 
     * @param {Pointer<Rect>} srcRect 
     * @param {Integer} srcUnit 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileSrcRectDestRectI(graphics, metafile_, destRect, srcRect, srcUnit, callback, callbackData, imageAttributes) {
        callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

        result := DllCall("gdiplus.dll\GdipEnumerateMetafileSrcRectDestRectI", "ptr", graphics, "ptr", metafile_, "ptr", destRect, "ptr", srcRect, "int", srcUnit, "ptr", callback, callbackDataMarshal, callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile_ 
     * @param {Pointer<PointF>} destPoints 
     * @param {Integer} count 
     * @param {Pointer<RectF>} srcRect 
     * @param {Integer} srcUnit 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileSrcRectDestPoints(graphics, metafile_, destPoints, count, srcRect, srcUnit, callback, callbackData, imageAttributes) {
        callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

        result := DllCall("gdiplus.dll\GdipEnumerateMetafileSrcRectDestPoints", "ptr", graphics, "ptr", metafile_, "ptr", destPoints, "int", count, "ptr", srcRect, "int", srcUnit, "ptr", callback, callbackDataMarshal, callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpMetafile>} metafile_ 
     * @param {Pointer<Point>} destPoints 
     * @param {Integer} count 
     * @param {Pointer<Rect>} srcRect 
     * @param {Integer} srcUnit 
     * @param {Pointer} callback 
     * @param {Pointer<Void>} callbackData 
     * @param {Pointer<GpImageAttributes>} imageAttributes 
     * @returns {Integer} 
     */
    static GdipEnumerateMetafileSrcRectDestPointsI(graphics, metafile_, destPoints, count, srcRect, srcUnit, callback, callbackData, imageAttributes) {
        callbackDataMarshal := callbackData is VarRef ? "ptr" : "ptr"

        result := DllCall("gdiplus.dll\GdipEnumerateMetafileSrcRectDestPointsI", "ptr", graphics, "ptr", metafile_, "ptr", destPoints, "int", count, "ptr", srcRect, "int", srcUnit, "ptr", callback, callbackDataMarshal, callbackData, "ptr", imageAttributes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpMetafile>} metafile_ 
     * @param {Integer} recordType 
     * @param {Integer} flags 
     * @param {Integer} dataSize 
     * @param {Pointer<Integer>} data 
     * @returns {Integer} 
     */
    static GdipPlayMetafileRecord(metafile_, recordType, flags, dataSize, data) {
        dataMarshal := data is VarRef ? "char*" : "ptr"

        result := DllCall("gdiplus.dll\GdipPlayMetafileRecord", "ptr", metafile_, "int", recordType, "uint", flags, "uint", dataSize, dataMarshal, data, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpGraphics>} srcgraphics 
     * @param {Integer} combineMode_ 
     * @returns {Integer} 
     */
    static GdipSetClipGraphics(graphics, srcgraphics, combineMode_) {
        result := DllCall("gdiplus.dll\GdipSetClipGraphics", "ptr", graphics, "ptr", srcgraphics, "int", combineMode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @param {Integer} combineMode_ 
     * @returns {Integer} 
     */
    static GdipSetClipRect(graphics, x, y, width, height, combineMode_) {
        result := DllCall("gdiplus.dll\GdipSetClipRect", "ptr", graphics, "float", x, "float", y, "float", width, "float", height, "int", combineMode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} combineMode_ 
     * @returns {Integer} 
     */
    static GdipSetClipRectI(graphics, x, y, width, height, combineMode_) {
        result := DllCall("gdiplus.dll\GdipSetClipRectI", "ptr", graphics, "int", x, "int", y, "int", width, "int", height, "int", combineMode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpPath>} path_ 
     * @param {Integer} combineMode_ 
     * @returns {Integer} 
     */
    static GdipSetClipPath(graphics, path_, combineMode_) {
        result := DllCall("gdiplus.dll\GdipSetClipPath", "ptr", graphics, "ptr", path_, "int", combineMode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpRegion>} region_ 
     * @param {Integer} combineMode_ 
     * @returns {Integer} 
     */
    static GdipSetClipRegion(graphics, region_, combineMode_) {
        result := DllCall("gdiplus.dll\GdipSetClipRegion", "ptr", graphics, "ptr", region_, "int", combineMode_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {HRGN} hRgn_ 
     * @param {Integer} combineMode_ 
     * @returns {Integer} 
     */
    static GdipSetClipHrgn(graphics, hRgn_, combineMode_) {
        hRgn_ := hRgn_ is Win32Handle ? NumGet(hRgn_, "ptr") : hRgn_

        result := DllCall("gdiplus.dll\GdipSetClipHrgn", "ptr", graphics, "ptr", hRgn_, "int", combineMode_, "int")
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
     * @param {Pointer<GpRegion>} region_ 
     * @returns {Integer} 
     */
    static GdipGetClip(graphics, region_) {
        result := DllCall("gdiplus.dll\GdipGetClip", "ptr", graphics, "ptr", region_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<RectF>} rect_ 
     * @returns {Integer} 
     */
    static GdipGetClipBounds(graphics, rect_) {
        result := DllCall("gdiplus.dll\GdipGetClipBounds", "ptr", graphics, "ptr", rect_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Rect>} rect_ 
     * @returns {Integer} 
     */
    static GdipGetClipBoundsI(graphics, rect_) {
        result := DllCall("gdiplus.dll\GdipGetClipBoundsI", "ptr", graphics, "ptr", rect_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result_ 
     * @returns {Integer} 
     */
    static GdipIsClipEmpty(graphics, result_) {
        result_Marshal := result_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipIsClipEmpty", "ptr", graphics, result_Marshal, result_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<RectF>} rect_ 
     * @returns {Integer} 
     */
    static GdipGetVisibleClipBounds(graphics, rect_) {
        result := DllCall("gdiplus.dll\GdipGetVisibleClipBounds", "ptr", graphics, "ptr", rect_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Rect>} rect_ 
     * @returns {Integer} 
     */
    static GdipGetVisibleClipBoundsI(graphics, rect_) {
        result := DllCall("gdiplus.dll\GdipGetVisibleClipBoundsI", "ptr", graphics, "ptr", rect_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<BOOL>} result_ 
     * @returns {Integer} 
     */
    static GdipIsVisibleClipEmpty(graphics, result_) {
        result_Marshal := result_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipIsVisibleClipEmpty", "ptr", graphics, result_Marshal, result_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Pointer<BOOL>} result_ 
     * @returns {Integer} 
     */
    static GdipIsVisiblePoint(graphics, x, y, result_) {
        result_Marshal := result_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipIsVisiblePoint", "ptr", graphics, "float", x, "float", y, result_Marshal, result_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Pointer<BOOL>} result_ 
     * @returns {Integer} 
     */
    static GdipIsVisiblePointI(graphics, x, y, result_) {
        result_Marshal := result_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipIsVisiblePointI", "ptr", graphics, "int", x, "int", y, result_Marshal, result_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Float} x 
     * @param {Float} y 
     * @param {Float} width 
     * @param {Float} height 
     * @param {Pointer<BOOL>} result_ 
     * @returns {Integer} 
     */
    static GdipIsVisibleRect(graphics, x, y, width, height, result_) {
        result_Marshal := result_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipIsVisibleRect", "ptr", graphics, "float", x, "float", y, "float", width, "float", height, result_Marshal, result_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Pointer<BOOL>} result_ 
     * @returns {Integer} 
     */
    static GdipIsVisibleRectI(graphics, x, y, width, height, result_) {
        result_Marshal := result_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipIsVisibleRectI", "ptr", graphics, "int", x, "int", y, "int", width, "int", height, result_Marshal, result_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Integer>} state 
     * @returns {Integer} 
     */
    static GdipSaveGraphics(graphics, state) {
        stateMarshal := state is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipSaveGraphics", "ptr", graphics, stateMarshal, state, "int")
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
     * @param {Integer} unit_ 
     * @param {Pointer<Integer>} state 
     * @returns {Integer} 
     */
    static GdipBeginContainer(graphics, dstrect, srcrect, unit_, state) {
        stateMarshal := state is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipBeginContainer", "ptr", graphics, "ptr", dstrect, "ptr", srcrect, "int", unit_, stateMarshal, state, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Rect>} dstrect 
     * @param {Pointer<Rect>} srcrect 
     * @param {Integer} unit_ 
     * @param {Pointer<Integer>} state 
     * @returns {Integer} 
     */
    static GdipBeginContainerI(graphics, dstrect, srcrect, unit_, state) {
        stateMarshal := state is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipBeginContainerI", "ptr", graphics, "ptr", dstrect, "ptr", srcrect, "int", unit_, stateMarshal, state, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Integer>} state 
     * @returns {Integer} 
     */
    static GdipBeginContainer2(graphics, state) {
        stateMarshal := state is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipBeginContainer2", "ptr", graphics, stateMarshal, state, "int")
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
     * @param {Pointer<WmfPlaceableFileHeader>} wmfPlaceableFileHeader_ 
     * @param {Pointer<MetafileHeader>} header 
     * @returns {Integer} 
     */
    static GdipGetMetafileHeaderFromWmf(hWmf, wmfPlaceableFileHeader_, header) {
        hWmf := hWmf is Win32Handle ? NumGet(hWmf, "ptr") : hWmf

        result := DllCall("gdiplus.dll\GdipGetMetafileHeaderFromWmf", "ptr", hWmf, "ptr", wmfPlaceableFileHeader_, "ptr", header, "int")
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
     * @param {IStream} stream 
     * @param {Pointer<MetafileHeader>} header 
     * @returns {Integer} 
     */
    static GdipGetMetafileHeaderFromStream(stream, header) {
        result := DllCall("gdiplus.dll\GdipGetMetafileHeaderFromStream", "ptr", stream, "ptr", header, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpMetafile>} metafile_ 
     * @param {Pointer<MetafileHeader>} header 
     * @returns {Integer} 
     */
    static GdipGetMetafileHeaderFromMetafile(metafile_, header) {
        result := DllCall("gdiplus.dll\GdipGetMetafileHeaderFromMetafile", "ptr", metafile_, "ptr", header, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpMetafile>} metafile_ 
     * @param {Pointer<HENHMETAFILE>} hEmf 
     * @returns {Integer} 
     */
    static GdipGetHemfFromMetafile(metafile_, hEmf) {
        result := DllCall("gdiplus.dll\GdipGetHemfFromMetafile", "ptr", metafile_, "ptr", hEmf, "int")
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

        result := DllCall("gdiplus.dll\GdipCreateStreamOnFile", "ptr", filename, "uint", access, "ptr*", stream, "int")
        return result
    }

    /**
     * 
     * @param {HMETAFILE} hWmf 
     * @param {BOOL} deleteWmf 
     * @param {Pointer<WmfPlaceableFileHeader>} wmfPlaceableFileHeader_ 
     * @param {Pointer<Pointer<GpMetafile>>} metafile_ 
     * @returns {Integer} 
     */
    static GdipCreateMetafileFromWmf(hWmf, deleteWmf, wmfPlaceableFileHeader_, metafile_) {
        hWmf := hWmf is Win32Handle ? NumGet(hWmf, "ptr") : hWmf

        metafile_Marshal := metafile_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateMetafileFromWmf", "ptr", hWmf, "int", deleteWmf, "ptr", wmfPlaceableFileHeader_, metafile_Marshal, metafile_, "int")
        return result
    }

    /**
     * 
     * @param {HENHMETAFILE} hEmf 
     * @param {BOOL} deleteEmf 
     * @param {Pointer<Pointer<GpMetafile>>} metafile_ 
     * @returns {Integer} 
     */
    static GdipCreateMetafileFromEmf(hEmf, deleteEmf, metafile_) {
        hEmf := hEmf is Win32Handle ? NumGet(hEmf, "ptr") : hEmf

        metafile_Marshal := metafile_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateMetafileFromEmf", "ptr", hEmf, "int", deleteEmf, metafile_Marshal, metafile_, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} file_ 
     * @param {Pointer<Pointer<GpMetafile>>} metafile_ 
     * @returns {Integer} 
     */
    static GdipCreateMetafileFromFile(file_, metafile_) {
        file_ := file_ is String ? StrPtr(file_) : file_

        metafile_Marshal := metafile_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateMetafileFromFile", "ptr", file_, metafile_Marshal, metafile_, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} file_ 
     * @param {Pointer<WmfPlaceableFileHeader>} wmfPlaceableFileHeader_ 
     * @param {Pointer<Pointer<GpMetafile>>} metafile_ 
     * @returns {Integer} 
     */
    static GdipCreateMetafileFromWmfFile(file_, wmfPlaceableFileHeader_, metafile_) {
        file_ := file_ is String ? StrPtr(file_) : file_

        metafile_Marshal := metafile_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateMetafileFromWmfFile", "ptr", file_, "ptr", wmfPlaceableFileHeader_, metafile_Marshal, metafile_, "int")
        return result
    }

    /**
     * 
     * @param {IStream} stream 
     * @param {Pointer<Pointer<GpMetafile>>} metafile_ 
     * @returns {Integer} 
     */
    static GdipCreateMetafileFromStream(stream, metafile_) {
        metafile_Marshal := metafile_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateMetafileFromStream", "ptr", stream, metafile_Marshal, metafile_, "int")
        return result
    }

    /**
     * 
     * @param {HDC} referenceHdc 
     * @param {Integer} type 
     * @param {Pointer<RectF>} frameRect 
     * @param {Integer} frameUnit 
     * @param {PWSTR} description 
     * @param {Pointer<Pointer<GpMetafile>>} metafile_ 
     * @returns {Integer} 
     */
    static GdipRecordMetafile(referenceHdc, type, frameRect, frameUnit, description, metafile_) {
        referenceHdc := referenceHdc is Win32Handle ? NumGet(referenceHdc, "ptr") : referenceHdc
        description := description is String ? StrPtr(description) : description

        metafile_Marshal := metafile_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipRecordMetafile", "ptr", referenceHdc, "int", type, "ptr", frameRect, "int", frameUnit, "ptr", description, metafile_Marshal, metafile_, "int")
        return result
    }

    /**
     * 
     * @param {HDC} referenceHdc 
     * @param {Integer} type 
     * @param {Pointer<Rect>} frameRect 
     * @param {Integer} frameUnit 
     * @param {PWSTR} description 
     * @param {Pointer<Pointer<GpMetafile>>} metafile_ 
     * @returns {Integer} 
     */
    static GdipRecordMetafileI(referenceHdc, type, frameRect, frameUnit, description, metafile_) {
        referenceHdc := referenceHdc is Win32Handle ? NumGet(referenceHdc, "ptr") : referenceHdc
        description := description is String ? StrPtr(description) : description

        metafile_Marshal := metafile_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipRecordMetafileI", "ptr", referenceHdc, "int", type, "ptr", frameRect, "int", frameUnit, "ptr", description, metafile_Marshal, metafile_, "int")
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
     * @param {Pointer<Pointer<GpMetafile>>} metafile_ 
     * @returns {Integer} 
     */
    static GdipRecordMetafileFileName(fileName, referenceHdc, type, frameRect, frameUnit, description, metafile_) {
        fileName := fileName is String ? StrPtr(fileName) : fileName
        referenceHdc := referenceHdc is Win32Handle ? NumGet(referenceHdc, "ptr") : referenceHdc
        description := description is String ? StrPtr(description) : description

        metafile_Marshal := metafile_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipRecordMetafileFileName", "ptr", fileName, "ptr", referenceHdc, "int", type, "ptr", frameRect, "int", frameUnit, "ptr", description, metafile_Marshal, metafile_, "int")
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
     * @param {Pointer<Pointer<GpMetafile>>} metafile_ 
     * @returns {Integer} 
     */
    static GdipRecordMetafileFileNameI(fileName, referenceHdc, type, frameRect, frameUnit, description, metafile_) {
        fileName := fileName is String ? StrPtr(fileName) : fileName
        referenceHdc := referenceHdc is Win32Handle ? NumGet(referenceHdc, "ptr") : referenceHdc
        description := description is String ? StrPtr(description) : description

        metafile_Marshal := metafile_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipRecordMetafileFileNameI", "ptr", fileName, "ptr", referenceHdc, "int", type, "ptr", frameRect, "int", frameUnit, "ptr", description, metafile_Marshal, metafile_, "int")
        return result
    }

    /**
     * 
     * @param {IStream} stream 
     * @param {HDC} referenceHdc 
     * @param {Integer} type 
     * @param {Pointer<RectF>} frameRect 
     * @param {Integer} frameUnit 
     * @param {PWSTR} description 
     * @param {Pointer<Pointer<GpMetafile>>} metafile_ 
     * @returns {Integer} 
     */
    static GdipRecordMetafileStream(stream, referenceHdc, type, frameRect, frameUnit, description, metafile_) {
        referenceHdc := referenceHdc is Win32Handle ? NumGet(referenceHdc, "ptr") : referenceHdc
        description := description is String ? StrPtr(description) : description

        metafile_Marshal := metafile_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipRecordMetafileStream", "ptr", stream, "ptr", referenceHdc, "int", type, "ptr", frameRect, "int", frameUnit, "ptr", description, metafile_Marshal, metafile_, "int")
        return result
    }

    /**
     * 
     * @param {IStream} stream 
     * @param {HDC} referenceHdc 
     * @param {Integer} type 
     * @param {Pointer<Rect>} frameRect 
     * @param {Integer} frameUnit 
     * @param {PWSTR} description 
     * @param {Pointer<Pointer<GpMetafile>>} metafile_ 
     * @returns {Integer} 
     */
    static GdipRecordMetafileStreamI(stream, referenceHdc, type, frameRect, frameUnit, description, metafile_) {
        referenceHdc := referenceHdc is Win32Handle ? NumGet(referenceHdc, "ptr") : referenceHdc
        description := description is String ? StrPtr(description) : description

        metafile_Marshal := metafile_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipRecordMetafileStreamI", "ptr", stream, "ptr", referenceHdc, "int", type, "ptr", frameRect, "int", frameUnit, "ptr", description, metafile_Marshal, metafile_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpMetafile>} metafile_ 
     * @param {Integer} metafileRasterizationLimitDpi 
     * @returns {Integer} 
     */
    static GdipSetMetafileDownLevelRasterizationLimit(metafile_, metafileRasterizationLimitDpi) {
        result := DllCall("gdiplus.dll\GdipSetMetafileDownLevelRasterizationLimit", "ptr", metafile_, "uint", metafileRasterizationLimitDpi, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpMetafile>} metafile_ 
     * @param {Pointer<Integer>} metafileRasterizationLimitDpi 
     * @returns {Integer} 
     */
    static GdipGetMetafileDownLevelRasterizationLimit(metafile_, metafileRasterizationLimitDpi) {
        metafileRasterizationLimitDpiMarshal := metafileRasterizationLimitDpi is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetMetafileDownLevelRasterizationLimit", "ptr", metafile_, metafileRasterizationLimitDpiMarshal, metafileRasterizationLimitDpi, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} numDecoders 
     * @param {Pointer<Integer>} size_ 
     * @returns {Integer} 
     */
    static GdipGetImageDecodersSize(numDecoders, size_) {
        numDecodersMarshal := numDecoders is VarRef ? "uint*" : "ptr"
        size_Marshal := size_ is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetImageDecodersSize", numDecodersMarshal, numDecoders, size_Marshal, size_, "int")
        return result
    }

    /**
     * 
     * @param {Integer} numDecoders 
     * @param {Integer} size_ 
     * @param {Pointer} decoders 
     * @returns {Integer} 
     */
    static GdipGetImageDecoders(numDecoders, size_, decoders) {
        result := DllCall("gdiplus.dll\GdipGetImageDecoders", "uint", numDecoders, "uint", size_, "ptr", decoders, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} numEncoders 
     * @param {Pointer<Integer>} size_ 
     * @returns {Integer} 
     */
    static GdipGetImageEncodersSize(numEncoders, size_) {
        numEncodersMarshal := numEncoders is VarRef ? "uint*" : "ptr"
        size_Marshal := size_ is VarRef ? "uint*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetImageEncodersSize", numEncodersMarshal, numEncoders, size_Marshal, size_, "int")
        return result
    }

    /**
     * 
     * @param {Integer} numEncoders 
     * @param {Integer} size_ 
     * @param {Pointer} encoders 
     * @returns {Integer} 
     */
    static GdipGetImageEncoders(numEncoders, size_, encoders) {
        result := DllCall("gdiplus.dll\GdipGetImageEncoders", "uint", numEncoders, "uint", size_, "ptr", encoders, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Integer} sizeData 
     * @param {Pointer<Integer>} data 
     * @returns {Integer} 
     */
    static GdipComment(graphics, sizeData, data) {
        dataMarshal := data is VarRef ? "char*" : "ptr"

        result := DllCall("gdiplus.dll\GdipComment", "ptr", graphics, "uint", sizeData, dataMarshal, data, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Pointer<GpFontCollection>} fontCollection_ 
     * @param {Pointer<Pointer<GpFontFamily>>} fontFamily_ 
     * @returns {Integer} 
     */
    static GdipCreateFontFamilyFromName(name, fontCollection_, fontFamily_) {
        name := name is String ? StrPtr(name) : name

        fontFamily_Marshal := fontFamily_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateFontFamilyFromName", "ptr", name, "ptr", fontCollection_, fontFamily_Marshal, fontFamily_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontFamily>} fontFamily_ 
     * @returns {Integer} 
     */
    static GdipDeleteFontFamily(fontFamily_) {
        result := DllCall("gdiplus.dll\GdipDeleteFontFamily", "ptr", fontFamily_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontFamily>} fontFamily_ 
     * @param {Pointer<Pointer<GpFontFamily>>} clonedFontFamily 
     * @returns {Integer} 
     */
    static GdipCloneFontFamily(fontFamily_, clonedFontFamily) {
        clonedFontFamilyMarshal := clonedFontFamily is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCloneFontFamily", "ptr", fontFamily_, clonedFontFamilyMarshal, clonedFontFamily, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<GpFontFamily>>} nativeFamily 
     * @returns {Integer} 
     */
    static GdipGetGenericFontFamilySansSerif(nativeFamily) {
        nativeFamilyMarshal := nativeFamily is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetGenericFontFamilySansSerif", nativeFamilyMarshal, nativeFamily, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<GpFontFamily>>} nativeFamily 
     * @returns {Integer} 
     */
    static GdipGetGenericFontFamilySerif(nativeFamily) {
        nativeFamilyMarshal := nativeFamily is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetGenericFontFamilySerif", nativeFamilyMarshal, nativeFamily, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<GpFontFamily>>} nativeFamily 
     * @returns {Integer} 
     */
    static GdipGetGenericFontFamilyMonospace(nativeFamily) {
        nativeFamilyMarshal := nativeFamily is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetGenericFontFamilyMonospace", nativeFamilyMarshal, nativeFamily, "int")
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
        IsStyleAvailableMarshal := IsStyleAvailable is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipIsStyleAvailable", "ptr", family, "int", style, IsStyleAvailableMarshal, IsStyleAvailable, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontFamily>} family 
     * @param {Integer} style 
     * @param {Pointer<Integer>} EmHeight 
     * @returns {Integer} 
     */
    static GdipGetEmHeight(family, style, EmHeight) {
        EmHeightMarshal := EmHeight is VarRef ? "ushort*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetEmHeight", "ptr", family, "int", style, EmHeightMarshal, EmHeight, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontFamily>} family 
     * @param {Integer} style 
     * @param {Pointer<Integer>} CellAscent 
     * @returns {Integer} 
     */
    static GdipGetCellAscent(family, style, CellAscent) {
        CellAscentMarshal := CellAscent is VarRef ? "ushort*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetCellAscent", "ptr", family, "int", style, CellAscentMarshal, CellAscent, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontFamily>} family 
     * @param {Integer} style 
     * @param {Pointer<Integer>} CellDescent 
     * @returns {Integer} 
     */
    static GdipGetCellDescent(family, style, CellDescent) {
        CellDescentMarshal := CellDescent is VarRef ? "ushort*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetCellDescent", "ptr", family, "int", style, CellDescentMarshal, CellDescent, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontFamily>} family 
     * @param {Integer} style 
     * @param {Pointer<Integer>} LineSpacing 
     * @returns {Integer} 
     */
    static GdipGetLineSpacing(family, style, LineSpacing) {
        LineSpacingMarshal := LineSpacing is VarRef ? "ushort*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetLineSpacing", "ptr", family, "int", style, LineSpacingMarshal, LineSpacing, "int")
        return result
    }

    /**
     * 
     * @param {HDC} hdc_ 
     * @param {Pointer<Pointer<GpFont>>} font_ 
     * @returns {Integer} 
     */
    static GdipCreateFontFromDC(hdc_, font_) {
        hdc_ := hdc_ is Win32Handle ? NumGet(hdc_, "ptr") : hdc_

        font_Marshal := font_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateFontFromDC", "ptr", hdc_, font_Marshal, font_, "int")
        return result
    }

    /**
     * 
     * @param {HDC} hdc_ 
     * @param {Pointer<LOGFONTA>} logfont 
     * @param {Pointer<Pointer<GpFont>>} font_ 
     * @returns {Integer} 
     */
    static GdipCreateFontFromLogfontA(hdc_, logfont, font_) {
        hdc_ := hdc_ is Win32Handle ? NumGet(hdc_, "ptr") : hdc_

        font_Marshal := font_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateFontFromLogfontA", "ptr", hdc_, "ptr", logfont, font_Marshal, font_, "int")
        return result
    }

    /**
     * 
     * @param {HDC} hdc_ 
     * @param {Pointer<LOGFONTW>} logfont 
     * @param {Pointer<Pointer<GpFont>>} font_ 
     * @returns {Integer} 
     */
    static GdipCreateFontFromLogfontW(hdc_, logfont, font_) {
        hdc_ := hdc_ is Win32Handle ? NumGet(hdc_, "ptr") : hdc_

        font_Marshal := font_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateFontFromLogfontW", "ptr", hdc_, "ptr", logfont, font_Marshal, font_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontFamily>} fontFamily_ 
     * @param {Float} emSize 
     * @param {Integer} style 
     * @param {Integer} unit_ 
     * @param {Pointer<Pointer<GpFont>>} font_ 
     * @returns {Integer} 
     */
    static GdipCreateFont(fontFamily_, emSize, style, unit_, font_) {
        font_Marshal := font_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateFont", "ptr", fontFamily_, "float", emSize, "int", style, "int", unit_, font_Marshal, font_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFont>} font_ 
     * @param {Pointer<Pointer<GpFont>>} cloneFont 
     * @returns {Integer} 
     */
    static GdipCloneFont(font_, cloneFont) {
        cloneFontMarshal := cloneFont is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCloneFont", "ptr", font_, cloneFontMarshal, cloneFont, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFont>} font_ 
     * @returns {Integer} 
     */
    static GdipDeleteFont(font_) {
        result := DllCall("gdiplus.dll\GdipDeleteFont", "ptr", font_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFont>} font_ 
     * @param {Pointer<Pointer<GpFontFamily>>} family 
     * @returns {Integer} 
     */
    static GdipGetFamily(font_, family) {
        familyMarshal := family is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetFamily", "ptr", font_, familyMarshal, family, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFont>} font_ 
     * @param {Pointer<Integer>} style 
     * @returns {Integer} 
     */
    static GdipGetFontStyle(font_, style) {
        styleMarshal := style is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetFontStyle", "ptr", font_, styleMarshal, style, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFont>} font_ 
     * @param {Pointer<Float>} size_ 
     * @returns {Integer} 
     */
    static GdipGetFontSize(font_, size_) {
        size_Marshal := size_ is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetFontSize", "ptr", font_, size_Marshal, size_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFont>} font_ 
     * @param {Pointer<Integer>} unit_ 
     * @returns {Integer} 
     */
    static GdipGetFontUnit(font_, unit_) {
        unit_Marshal := unit_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetFontUnit", "ptr", font_, unit_Marshal, unit_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFont>} font_ 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Float>} height 
     * @returns {Integer} 
     */
    static GdipGetFontHeight(font_, graphics, height) {
        heightMarshal := height is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetFontHeight", "ptr", font_, "ptr", graphics, heightMarshal, height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFont>} font_ 
     * @param {Float} dpi 
     * @param {Pointer<Float>} height 
     * @returns {Integer} 
     */
    static GdipGetFontHeightGivenDPI(font_, dpi, height) {
        heightMarshal := height is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetFontHeightGivenDPI", "ptr", font_, "float", dpi, heightMarshal, height, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFont>} font_ 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<LOGFONTA>} logfontA_ 
     * @returns {Integer} 
     */
    static GdipGetLogFontA(font_, graphics, logfontA_) {
        result := DllCall("gdiplus.dll\GdipGetLogFontA", "ptr", font_, "ptr", graphics, "ptr", logfontA_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFont>} font_ 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<LOGFONTW>} logfontW_ 
     * @returns {Integer} 
     */
    static GdipGetLogFontW(font_, graphics, logfontW_) {
        result := DllCall("gdiplus.dll\GdipGetLogFontW", "ptr", font_, "ptr", graphics, "ptr", logfontW_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<GpFontCollection>>} fontCollection_ 
     * @returns {Integer} 
     */
    static GdipNewInstalledFontCollection(fontCollection_) {
        fontCollection_Marshal := fontCollection_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipNewInstalledFontCollection", fontCollection_Marshal, fontCollection_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<GpFontCollection>>} fontCollection_ 
     * @returns {Integer} 
     */
    static GdipNewPrivateFontCollection(fontCollection_) {
        fontCollection_Marshal := fontCollection_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipNewPrivateFontCollection", fontCollection_Marshal, fontCollection_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<GpFontCollection>>} fontCollection_ 
     * @returns {Integer} 
     */
    static GdipDeletePrivateFontCollection(fontCollection_) {
        fontCollection_Marshal := fontCollection_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipDeletePrivateFontCollection", fontCollection_Marshal, fontCollection_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontCollection>} fontCollection_ 
     * @param {Pointer<Integer>} numFound 
     * @returns {Integer} 
     */
    static GdipGetFontCollectionFamilyCount(fontCollection_, numFound) {
        numFoundMarshal := numFound is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetFontCollectionFamilyCount", "ptr", fontCollection_, numFoundMarshal, numFound, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontCollection>} fontCollection_ 
     * @param {Integer} numSought 
     * @param {Pointer<Pointer<GpFontFamily>>} gpfamilies 
     * @param {Pointer<Integer>} numFound 
     * @returns {Integer} 
     */
    static GdipGetFontCollectionFamilyList(fontCollection_, numSought, gpfamilies, numFound) {
        gpfamiliesMarshal := gpfamilies is VarRef ? "ptr*" : "ptr"
        numFoundMarshal := numFound is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetFontCollectionFamilyList", "ptr", fontCollection_, "int", numSought, gpfamiliesMarshal, gpfamilies, numFoundMarshal, numFound, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontCollection>} fontCollection_ 
     * @param {PWSTR} filename 
     * @returns {Integer} 
     */
    static GdipPrivateAddFontFile(fontCollection_, filename) {
        filename := filename is String ? StrPtr(filename) : filename

        result := DllCall("gdiplus.dll\GdipPrivateAddFontFile", "ptr", fontCollection_, "ptr", filename, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpFontCollection>} fontCollection_ 
     * @param {Pointer<Void>} memory 
     * @param {Integer} length 
     * @returns {Integer} 
     */
    static GdipPrivateAddMemoryFont(fontCollection_, memory, length) {
        memoryMarshal := memory is VarRef ? "ptr" : "ptr"

        result := DllCall("gdiplus.dll\GdipPrivateAddMemoryFont", "ptr", fontCollection_, memoryMarshal, memory, "int", length, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {PWSTR} string_ 
     * @param {Integer} length 
     * @param {Pointer<GpFont>} font_ 
     * @param {Pointer<RectF>} layoutRect 
     * @param {Pointer<GpStringFormat>} stringFormat 
     * @param {Pointer<GpBrush>} brush 
     * @returns {Integer} 
     */
    static GdipDrawString(graphics, string_, length, font_, layoutRect, stringFormat, brush) {
        string_ := string_ is String ? StrPtr(string_) : string_

        result := DllCall("gdiplus.dll\GdipDrawString", "ptr", graphics, "ptr", string_, "int", length, "ptr", font_, "ptr", layoutRect, "ptr", stringFormat, "ptr", brush, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {PWSTR} string_ 
     * @param {Integer} length 
     * @param {Pointer<GpFont>} font_ 
     * @param {Pointer<RectF>} layoutRect 
     * @param {Pointer<GpStringFormat>} stringFormat 
     * @param {Pointer<RectF>} boundingBox 
     * @param {Pointer<Integer>} codepointsFitted 
     * @param {Pointer<Integer>} linesFilled 
     * @returns {Integer} 
     */
    static GdipMeasureString(graphics, string_, length, font_, layoutRect, stringFormat, boundingBox, codepointsFitted, linesFilled) {
        string_ := string_ is String ? StrPtr(string_) : string_

        codepointsFittedMarshal := codepointsFitted is VarRef ? "int*" : "ptr"
        linesFilledMarshal := linesFilled is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipMeasureString", "ptr", graphics, "ptr", string_, "int", length, "ptr", font_, "ptr", layoutRect, "ptr", stringFormat, "ptr", boundingBox, codepointsFittedMarshal, codepointsFitted, linesFilledMarshal, linesFilled, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {PWSTR} string_ 
     * @param {Integer} length 
     * @param {Pointer<GpFont>} font_ 
     * @param {Pointer<RectF>} layoutRect 
     * @param {Pointer<GpStringFormat>} stringFormat 
     * @param {Integer} regionCount 
     * @param {Pointer<Pointer<GpRegion>>} regions 
     * @returns {Integer} 
     */
    static GdipMeasureCharacterRanges(graphics, string_, length, font_, layoutRect, stringFormat, regionCount, regions) {
        string_ := string_ is String ? StrPtr(string_) : string_

        regionsMarshal := regions is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipMeasureCharacterRanges", "ptr", graphics, "ptr", string_, "int", length, "ptr", font_, "ptr", layoutRect, "ptr", stringFormat, "int", regionCount, regionsMarshal, regions, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Integer>} text 
     * @param {Integer} length 
     * @param {Pointer<GpFont>} font_ 
     * @param {Pointer<GpBrush>} brush 
     * @param {Pointer<PointF>} positions 
     * @param {Integer} flags 
     * @param {Pointer<Matrix>} matrix_ 
     * @returns {Integer} 
     */
    static GdipDrawDriverString(graphics, text, length, font_, brush, positions, flags, matrix_) {
        textMarshal := text is VarRef ? "ushort*" : "ptr"

        result := DllCall("gdiplus.dll\GdipDrawDriverString", "ptr", graphics, textMarshal, text, "int", length, "ptr", font_, "ptr", brush, "ptr", positions, "int", flags, "ptr", matrix_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Integer>} text 
     * @param {Integer} length 
     * @param {Pointer<GpFont>} font_ 
     * @param {Pointer<PointF>} positions 
     * @param {Integer} flags 
     * @param {Pointer<Matrix>} matrix_ 
     * @param {Pointer<RectF>} boundingBox 
     * @returns {Integer} 
     */
    static GdipMeasureDriverString(graphics, text, length, font_, positions, flags, matrix_, boundingBox) {
        textMarshal := text is VarRef ? "ushort*" : "ptr"

        result := DllCall("gdiplus.dll\GdipMeasureDriverString", "ptr", graphics, textMarshal, text, "int", length, "ptr", font_, "ptr", positions, "int", flags, "ptr", matrix_, "ptr", boundingBox, "int")
        return result
    }

    /**
     * 
     * @param {Integer} formatAttributes 
     * @param {Integer} language 
     * @param {Pointer<Pointer<GpStringFormat>>} format 
     * @returns {Integer} 
     */
    static GdipCreateStringFormat(formatAttributes, language, format) {
        formatMarshal := format is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateStringFormat", "int", formatAttributes, "ushort", language, formatMarshal, format, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<GpStringFormat>>} format 
     * @returns {Integer} 
     */
    static GdipStringFormatGetGenericDefault(format) {
        formatMarshal := format is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipStringFormatGetGenericDefault", formatMarshal, format, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<GpStringFormat>>} format 
     * @returns {Integer} 
     */
    static GdipStringFormatGetGenericTypographic(format) {
        formatMarshal := format is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipStringFormatGetGenericTypographic", formatMarshal, format, "int")
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
     * @param {Pointer<Pointer<GpStringFormat>>} newFormat 
     * @returns {Integer} 
     */
    static GdipCloneStringFormat(format, newFormat) {
        newFormatMarshal := newFormat is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCloneStringFormat", "ptr", format, newFormatMarshal, newFormat, "int")
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
     * @param {Pointer<Integer>} flags 
     * @returns {Integer} 
     */
    static GdipGetStringFormatFlags(format, flags) {
        flagsMarshal := flags is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetStringFormatFlags", "ptr", format, flagsMarshal, flags, "int")
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
     * @param {Pointer<Integer>} align 
     * @returns {Integer} 
     */
    static GdipGetStringFormatAlign(format, align) {
        alignMarshal := align is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetStringFormatAlign", "ptr", format, alignMarshal, align, "int")
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
     * @param {Pointer<Integer>} align 
     * @returns {Integer} 
     */
    static GdipGetStringFormatLineAlign(format, align) {
        alignMarshal := align is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetStringFormatLineAlign", "ptr", format, alignMarshal, align, "int")
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
     * @param {Pointer<Integer>} trimming 
     * @returns {Integer} 
     */
    static GdipGetStringFormatTrimming(format, trimming) {
        trimmingMarshal := trimming is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetStringFormatTrimming", "ptr", format, trimmingMarshal, trimming, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Integer} hotkeyPrefix_ 
     * @returns {Integer} 
     */
    static GdipSetStringFormatHotkeyPrefix(format, hotkeyPrefix_) {
        result := DllCall("gdiplus.dll\GdipSetStringFormatHotkeyPrefix", "ptr", format, "int", hotkeyPrefix_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Pointer<Integer>} hotkeyPrefix_ 
     * @returns {Integer} 
     */
    static GdipGetStringFormatHotkeyPrefix(format, hotkeyPrefix_) {
        hotkeyPrefix_Marshal := hotkeyPrefix_ is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetStringFormatHotkeyPrefix", "ptr", format, hotkeyPrefix_Marshal, hotkeyPrefix_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Float} firstTabOffset 
     * @param {Integer} count 
     * @param {Pointer<Float>} tabStops 
     * @returns {Integer} 
     */
    static GdipSetStringFormatTabStops(format, firstTabOffset, count, tabStops) {
        tabStopsMarshal := tabStops is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipSetStringFormatTabStops", "ptr", format, "float", firstTabOffset, "int", count, tabStopsMarshal, tabStops, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Integer} count 
     * @param {Pointer<Float>} firstTabOffset 
     * @param {Pointer<Float>} tabStops 
     * @returns {Integer} 
     */
    static GdipGetStringFormatTabStops(format, count, firstTabOffset, tabStops) {
        firstTabOffsetMarshal := firstTabOffset is VarRef ? "float*" : "ptr"
        tabStopsMarshal := tabStops is VarRef ? "float*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetStringFormatTabStops", "ptr", format, "int", count, firstTabOffsetMarshal, firstTabOffset, tabStopsMarshal, tabStops, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Pointer<Integer>} count 
     * @returns {Integer} 
     */
    static GdipGetStringFormatTabStopCount(format, count) {
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetStringFormatTabStopCount", "ptr", format, countMarshal, count, "int")
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
     * @param {Pointer<Integer>} language 
     * @param {Pointer<Integer>} substitute 
     * @returns {Integer} 
     */
    static GdipGetStringFormatDigitSubstitution(format, language, substitute) {
        languageMarshal := language is VarRef ? "ushort*" : "ptr"
        substituteMarshal := substitute is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetStringFormatDigitSubstitution", "ptr", format, languageMarshal, language, substituteMarshal, substitute, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpStringFormat>} format 
     * @param {Pointer<Integer>} count 
     * @returns {Integer} 
     */
    static GdipGetStringFormatMeasurableCharacterRangeCount(format, count) {
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := DllCall("gdiplus.dll\GdipGetStringFormatMeasurableCharacterRangeCount", "ptr", format, countMarshal, count, "int")
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
     * @param {Pointer<GpBitmap>} bitmap_ 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<Pointer<GpCachedBitmap>>} cachedBitmap_ 
     * @returns {Integer} 
     */
    static GdipCreateCachedBitmap(bitmap_, graphics, cachedBitmap_) {
        cachedBitmap_Marshal := cachedBitmap_ is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipCreateCachedBitmap", "ptr", bitmap_, "ptr", graphics, cachedBitmap_Marshal, cachedBitmap_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpCachedBitmap>} cachedBitmap_ 
     * @returns {Integer} 
     */
    static GdipDeleteCachedBitmap(cachedBitmap_) {
        result := DllCall("gdiplus.dll\GdipDeleteCachedBitmap", "ptr", cachedBitmap_, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} graphics 
     * @param {Pointer<GpCachedBitmap>} cachedBitmap_ 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {Integer} 
     */
    static GdipDrawCachedBitmap(graphics, cachedBitmap_, x, y) {
        result := DllCall("gdiplus.dll\GdipDrawCachedBitmap", "ptr", graphics, "ptr", cachedBitmap_, "int", x, "int", y, "int")
        return result
    }

    /**
     * 
     * @param {HENHMETAFILE} hemf 
     * @param {Integer} cbData16 
     * @param {Pointer<Integer>} pData16 
     * @param {Integer} iMapMode 
     * @param {Integer} eFlags 
     * @returns {Integer} 
     */
    static GdipEmfToWmfBits(hemf, cbData16, pData16, iMapMode, eFlags) {
        hemf := hemf is Win32Handle ? NumGet(hemf, "ptr") : hemf

        pData16Marshal := pData16 is VarRef ? "char*" : "ptr"

        result := DllCall("gdiplus.dll\GdipEmfToWmfBits", "ptr", hemf, "uint", cbData16, pData16Marshal, pData16, "int", iMapMode, "int", eFlags, "uint")
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
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := DllCall("gdiplus.dll\GdipTestControl", "int", control, param1Marshal, param1, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} token 
     * @returns {Integer} 
     */
    static GdiplusNotificationHook(token) {
        tokenMarshal := token is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdiplusNotificationHook", tokenMarshal, token, "int")
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
     * @param {Pointer<GpMetafile>} metafile_ 
     * @param {Pointer<Integer>} conversionFailureFlag 
     * @param {Integer} emfType_ 
     * @param {PWSTR} description 
     * @param {Pointer<Pointer<GpMetafile>>} out_metafile 
     * @returns {Integer} 
     */
    static GdipConvertToEmfPlus(refGraphics, metafile_, conversionFailureFlag, emfType_, description, out_metafile) {
        description := description is String ? StrPtr(description) : description

        conversionFailureFlagMarshal := conversionFailureFlag is VarRef ? "int*" : "ptr"
        out_metafileMarshal := out_metafile is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipConvertToEmfPlus", "ptr", refGraphics, "ptr", metafile_, conversionFailureFlagMarshal, conversionFailureFlag, "int", emfType_, "ptr", description, out_metafileMarshal, out_metafile, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} refGraphics 
     * @param {Pointer<GpMetafile>} metafile_ 
     * @param {Pointer<Integer>} conversionFailureFlag 
     * @param {PWSTR} filename 
     * @param {Integer} emfType_ 
     * @param {PWSTR} description 
     * @param {Pointer<Pointer<GpMetafile>>} out_metafile 
     * @returns {Integer} 
     */
    static GdipConvertToEmfPlusToFile(refGraphics, metafile_, conversionFailureFlag, filename, emfType_, description, out_metafile) {
        filename := filename is String ? StrPtr(filename) : filename
        description := description is String ? StrPtr(description) : description

        conversionFailureFlagMarshal := conversionFailureFlag is VarRef ? "int*" : "ptr"
        out_metafileMarshal := out_metafile is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipConvertToEmfPlusToFile", "ptr", refGraphics, "ptr", metafile_, conversionFailureFlagMarshal, conversionFailureFlag, "ptr", filename, "int", emfType_, "ptr", description, out_metafileMarshal, out_metafile, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GpGraphics>} refGraphics 
     * @param {Pointer<GpMetafile>} metafile_ 
     * @param {Pointer<Integer>} conversionFailureFlag 
     * @param {IStream} stream 
     * @param {Integer} emfType_ 
     * @param {PWSTR} description 
     * @param {Pointer<Pointer<GpMetafile>>} out_metafile 
     * @returns {Integer} 
     */
    static GdipConvertToEmfPlusToStream(refGraphics, metafile_, conversionFailureFlag, stream, emfType_, description, out_metafile) {
        description := description is String ? StrPtr(description) : description

        conversionFailureFlagMarshal := conversionFailureFlag is VarRef ? "int*" : "ptr"
        out_metafileMarshal := out_metafile is VarRef ? "ptr*" : "ptr"

        result := DllCall("gdiplus.dll\GdipConvertToEmfPlusToStream", "ptr", refGraphics, "ptr", metafile_, conversionFailureFlagMarshal, conversionFailureFlag, "ptr", stream, "int", emfType_, "ptr", description, out_metafileMarshal, out_metafile, "int")
        return result
    }

;@endregion Methods
}
