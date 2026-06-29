#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct EXTTEXTMETRIC {
    #StructPack 2

    emSize : Int16

    emPointSize : Int16

    emOrientation : Int16

    emMasterHeight : Int16

    emMinScale : Int16

    emMaxScale : Int16

    emMasterUnits : Int16

    emCapHeight : Int16

    emXHeight : Int16

    emLowerCaseAscent : Int16

    emLowerCaseDescent : Int16

    emSlant : Int16

    emSuperScript : Int16

    emSubScript : Int16

    emSuperScriptSize : Int16

    emSubScriptSize : Int16

    emUnderlineOffset : Int16

    emUnderlineWidth : Int16

    emDoubleUpperUnderlineOffset : Int16

    emDoubleLowerUnderlineOffset : Int16

    emDoubleUpperUnderlineWidth : Int16

    emDoubleLowerUnderlineWidth : Int16

    emStrikeOutOffset : Int16

    emStrikeOutWidth : Int16

    emKernPairs : UInt16

    emKernTracks : UInt16

}
