#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IRegisterServiceProvider interface registers an object as a service with the Filter Graph Manager. For more information, see IRegisterServiceProvider::RegisterService.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iregisterserviceprovider
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IRegisterServiceProvider extends IUnknown{
    /**
     * The interface identifier for IRegisterServiceProvider
     * @type {Guid}
     */
    static IID => Guid("{7b3a2f01-0751-48dd-b556-004785171c54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} guidService 
     * @param {Pointer<IUnknown>} pUnkObject 
     * @returns {HRESULT} 
     */
    RegisterService(guidService, pUnkObject) {
        result := ComCall(3, this, "ptr", guidService, "ptr", pUnkObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
