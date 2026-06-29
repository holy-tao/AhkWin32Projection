#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINTRUST_DETACHED_SIG_BLOBS.ahk" { WINTRUST_DETACHED_SIG_BLOBS }
#Import ".\WINTRUST_DETACHED_SIG_FILE_HANDLES.ahk" { WINTRUST_DETACHED_SIG_FILE_HANDLES }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WINTRUST_DETACHED_SIG_INFO {
    #StructPack 8

    cbStruct : UInt32

    dwUnionChoice : UInt32

    pDetachedSigHandles : WINTRUST_DETACHED_SIG_FILE_HANDLES.Ptr

    static __New() {
        DefineProp(this.Prototype, 'pDetachedSigBlobs', { type: WINTRUST_DETACHED_SIG_BLOBS.Ptr, offset: 8 })
        this.DeleteProp("__New")
    }
}
