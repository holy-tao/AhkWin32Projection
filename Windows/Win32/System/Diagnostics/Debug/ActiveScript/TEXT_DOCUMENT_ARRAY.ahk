#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IDebugDocumentText.ahk" { IDebugDocumentText }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct TEXT_DOCUMENT_ARRAY {
    #StructPack 8

    dwCount : UInt32

    Members : IDebugDocumentText.Ptr

}
