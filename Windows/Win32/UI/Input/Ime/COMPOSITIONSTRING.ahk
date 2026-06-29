#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct COMPOSITIONSTRING {
    #StructPack 4

    dwSize : UInt32

    dwCompReadAttrLen : UInt32

    dwCompReadAttrOffset : UInt32

    dwCompReadClauseLen : UInt32

    dwCompReadClauseOffset : UInt32

    dwCompReadStrLen : UInt32

    dwCompReadStrOffset : UInt32

    dwCompAttrLen : UInt32

    dwCompAttrOffset : UInt32

    dwCompClauseLen : UInt32

    dwCompClauseOffset : UInt32

    dwCompStrLen : UInt32

    dwCompStrOffset : UInt32

    dwCursorPos : UInt32

    dwDeltaStart : UInt32

    dwResultReadClauseLen : UInt32

    dwResultReadClauseOffset : UInt32

    dwResultReadStrLen : UInt32

    dwResultReadStrOffset : UInt32

    dwResultClauseLen : UInt32

    dwResultClauseOffset : UInt32

    dwResultStrLen : UInt32

    dwResultStrOffset : UInt32

    dwPrivateSize : UInt32

    dwPrivateOffset : UInt32

}
