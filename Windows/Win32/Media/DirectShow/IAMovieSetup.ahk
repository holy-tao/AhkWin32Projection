#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface has been deprecated. (IAMovieSetup)
 * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nn-strmif-iamoviesetup
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
     * @remarks
     * This method registers the filter, its pins, and the media type associated with the pins. It should be implemented to use <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ifiltermapper">IFilterMapper</a> methods to accomplish this. See the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/cbasefilter-register">CBaseFilter::Register</a> member function for a description of its implementation.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-iamoviesetup-register
     */
    Register() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  The IAMovieSetup interface is deprecated. Use the AMovieDllRegisterServer2 function instead. Removes the filter from the registry.
     * @remarks
     * This method should be implemented to use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifiltermapper-unregisterfilter">IFilterMapper::UnregisterFilter</a> method to remove the filter from the registry. This effectively removes the pins and media types as well.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-iamoviesetup-unregister
     */
    Unregister() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
