#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_PictureParameters {
    #StructPack 2

    wDecodedPictureIndex : UInt16

    wDeblockedPictureIndex : UInt16

    wForwardRefPictureIndex : UInt16

    wBackwardRefPictureIndex : UInt16

    wPicWidthInMBminus1 : UInt16

    wPicHeightInMBminus1 : UInt16

    bMacroblockWidthMinus1 : Int8

    bMacroblockHeightMinus1 : Int8

    bBlockWidthMinus1 : Int8

    bBlockHeightMinus1 : Int8

    bBPPminus1 : Int8

    bPicStructure : Int8

    bSecondField : Int8

    bPicIntra : Int8

    bPicBackwardPrediction : Int8

    bBidirectionalAveragingMode : Int8

    bMVprecisionAndChromaRelation : Int8

    bChromaFormat : Int8

    bPicScanFixed : Int8

    bPicScanMethod : Int8

    bPicReadbackRequests : Int8

    bRcontrol : Int8

    bPicSpatialResid8 : Int8

    bPicOverflowBlocks : Int8

    bPicExtrapolation : Int8

    bPicDeblocked : Int8

    bPicDeblockConfined : Int8

    bPic4MVallowed : Int8

    bPicOBMC : Int8

    bPicBinPB : Int8

    bMV_RPS : Int8

    bReservedBits : Int8

    wBitstreamFcodes : UInt16

    wBitstreamPCEelements : UInt16

    bBitstreamConcealmentNeed : Int8

    bBitstreamConcealmentMethod : Int8

}
