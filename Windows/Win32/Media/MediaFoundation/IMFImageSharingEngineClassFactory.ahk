#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IMFImageSharingEngine.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates an instance of the IMFImageSharingEngine.
 * @see https://docs.microsoft.com/windows/win32/api//mfsharingengine/nn-mfsharingengine-imfimagesharingengineclassfactory
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFImageSharingEngineClassFactory extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstanceFromUDN"]

    /**
     * 
     * @param {BSTR} pUniqueDeviceName 
     * @returns {IMFImageSharingEngine} 
     * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nf-mfsharingengine-imfimagesharingengineclassfactory-createinstancefromudn
     */
    CreateInstanceFromUDN(pUniqueDeviceName) {
        pUniqueDeviceName := pUniqueDeviceName is String ? BSTR.Alloc(pUniqueDeviceName).Value : pUniqueDeviceName

        result := ComCall(3, this, "ptr", pUniqueDeviceName, "ptr*", &ppEngine := 0, "HRESULT")
        return IMFImageSharingEngine(ppEngine)
    }
}
