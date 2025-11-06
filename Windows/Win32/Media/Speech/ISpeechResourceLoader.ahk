#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechResourceLoader extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechResourceLoader
     * @type {Guid}
     */
    static IID => Guid("{b9ac5783-fcd0-4b21-b119-b4f8da8fd2c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadResource", "GetLocalCopy", "ReleaseLocalCopy"]

    /**
     * Retrieves a handle that can be used to obtain a pointer to the first byte of the specified resource in memory.
     * @param {BSTR} bstrResourceUri 
     * @param {VARIANT_BOOL} fAlwaysReload 
     * @param {Pointer<IUnknown>} pStream 
     * @param {Pointer<BSTR>} pbstrMIMEType 
     * @param {Pointer<VARIANT_BOOL>} pfModified 
     * @param {Pointer<BSTR>} pbstrRedirectUrl 
     * @returns {HRESULT} Type: <b>HGLOBAL</b>
     * 
     * If the function succeeds, the return value is a handle to the data associated with the resource.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//libloaderapi/nf-libloaderapi-loadresource
     */
    LoadResource(bstrResourceUri, fAlwaysReload, pStream, pbstrMIMEType, pfModified, pbstrRedirectUrl) {
        bstrResourceUri := bstrResourceUri is String ? BSTR.Alloc(bstrResourceUri).Value : bstrResourceUri

        pfModifiedMarshal := pfModified is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, "ptr", bstrResourceUri, "short", fAlwaysReload, "ptr*", pStream, "ptr", pbstrMIMEType, pfModifiedMarshal, pfModified, "ptr", pbstrRedirectUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrResourceUri 
     * @param {Pointer<BSTR>} pbstrLocalPath 
     * @param {Pointer<BSTR>} pbstrMIMEType 
     * @param {Pointer<BSTR>} pbstrRedirectUrl 
     * @returns {HRESULT} 
     */
    GetLocalCopy(bstrResourceUri, pbstrLocalPath, pbstrMIMEType, pbstrRedirectUrl) {
        bstrResourceUri := bstrResourceUri is String ? BSTR.Alloc(bstrResourceUri).Value : bstrResourceUri

        result := ComCall(8, this, "ptr", bstrResourceUri, "ptr", pbstrLocalPath, "ptr", pbstrMIMEType, "ptr", pbstrRedirectUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pbstrLocalPath 
     * @returns {HRESULT} 
     */
    ReleaseLocalCopy(pbstrLocalPath) {
        pbstrLocalPath := pbstrLocalPath is String ? BSTR.Alloc(pbstrLocalPath).Value : pbstrLocalPath

        result := ComCall(9, this, "ptr", pbstrLocalPath, "HRESULT")
        return result
    }
}
