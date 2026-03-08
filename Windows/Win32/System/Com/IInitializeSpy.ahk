#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Performs initialization or cleanup when entering or exiting a COM apartment.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-iinitializespy
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IInitializeSpy extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInitializeSpy
     * @type {Guid}
     */
    static IID => Guid("{00000034-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PreInitialize", "PostInitialize", "PreUninitialize", "PostUninitialize"]

    /**
     * Performs initialization steps required before calling the CoInitializeEx function.
     * @param {Integer} dwCoInit The apartment type passed to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a>, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/ne-objbase-coinit">COINIT</a> enumeration.
     * @param {Integer} dwCurThreadAptRefs The number of times <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> has been called on this thread.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iinitializespy-preinitialize
     */
    PreInitialize(dwCoInit, dwCurThreadAptRefs) {
        result := ComCall(3, this, "uint", dwCoInit, "uint", dwCurThreadAptRefs, "HRESULT")
        return result
    }

    /**
     * Performs initialization steps required after calling the CoInitializeEx function.
     * @remarks
     * The return value from <b>PostInitialize</b> is intended to be the returned <b>HRESULT</b> from the call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a>. This is always the case for a single active registration on this thread.
     * 
     * For cases where there are multiple registrations active on this thread, the returned <b>HRESULT</b> is arrived at by chaining of the various <b>PostInitialize</b> methods as follows: The COM determined <b>HRESULT</b> will be passed as the <i>hrCoInit</i> parameter to the first <b>PostInitialize</b> method called. The <b>HRESULT</b> from that <b>PostInitialize</b> call will be passed as the <i>hrCoInit</i> parameter to the next <b>PostInitialize</b> call. This chaining continues leading to the <b>HRESULT</b> from the last <b>PostInitialize</b> call being returned as the <b>HRESULT</b> from the call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a>.
     * @param {HRESULT} hrCoInit The value returned by <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a>.
     * @param {Integer} dwCoInit The apartment type passed to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a>, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/ne-objbase-coinit">COINIT</a> enumeration.
     * @param {Integer} dwNewThreadAptRefs The number of times <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> has been called on this thread.
     * @returns {HRESULT} This method returns the value that it intends the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> call to return to its caller. For more information, see the Remarks section.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iinitializespy-postinitialize
     */
    PostInitialize(hrCoInit, dwCoInit, dwNewThreadAptRefs) {
        result := ComCall(4, this, "int", hrCoInit, "uint", dwCoInit, "uint", dwNewThreadAptRefs, "HRESULT")
        return result
    }

    /**
     * Performs cleanup steps required before calling the CoUninitialize function.
     * @param {Integer} dwCurThreadAptRefs The number of times <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> has been called on this thread.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iinitializespy-preuninitialize
     */
    PreUninitialize(dwCurThreadAptRefs) {
        result := ComCall(5, this, "uint", dwCurThreadAptRefs, "HRESULT")
        return result
    }

    /**
     * Performs cleanup steps required after calling the CoUninitialize function.
     * @param {Integer} dwNewThreadAptRefs The number of calls to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-couninitialize">CoUninitialize</a> remaining on this thread.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iinitializespy-postuninitialize
     */
    PostUninitialize(dwNewThreadAptRefs) {
        result := ComCall(6, this, "uint", dwNewThreadAptRefs, "HRESULT")
        return result
    }
}
