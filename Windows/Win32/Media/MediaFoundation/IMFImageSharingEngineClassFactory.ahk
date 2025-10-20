#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates an instance of the IMFImageSharingEngine.
 * @see https://docs.microsoft.com/windows/win32/api//mfsharingengine/nn-mfsharingengine-imfimagesharingengineclassfactory
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFImageSharingEngineClassFactory extends IUnknown{
    /**
     * The interface identifier for IMFImageSharingEngineClassFactory
     * @type {Guid}
     */
    static IID => Guid("{1fc55727-a7fb-4fc8-83ae-8af024990af1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BSTR} pUniqueDeviceName 
     * @param {Pointer<IMFImageSharingEngine>} ppEngine 
     * @returns {HRESULT} 
     */
    CreateInstanceFromUDN(pUniqueDeviceName, ppEngine) {
        pUniqueDeviceName := pUniqueDeviceName is String ? BSTR.Alloc(pUniqueDeviceName).Value : pUniqueDeviceName

        result := ComCall(3, this, "ptr", pUniqueDeviceName, "ptr", ppEngine, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
