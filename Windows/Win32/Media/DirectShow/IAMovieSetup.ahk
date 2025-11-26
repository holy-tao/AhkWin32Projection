#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface has been deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamoviesetup
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMovieSetup extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMovieSetup
     * @type {Guid}
     */
    static IID => Guid("{a3d8cec0-7e5a-11cf-bbc5-00805f6cef20}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Register", "Unregister"]

    /**
     * Note  The IAMovieSetup interface is deprecated. Use the AMovieDllRegisterServer2 function instead. Adds the filter to the registry.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamoviesetup-register
     */
    Register() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Note  The IAMovieSetup interface is deprecated. Use the AMovieDllRegisterServer2 function instead. Removes the filter from the registry.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamoviesetup-unregister
     */
    Unregister() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
