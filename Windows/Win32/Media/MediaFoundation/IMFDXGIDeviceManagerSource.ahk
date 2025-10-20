#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides functionality for getting the IMFDXGIDeviceManager from the Microsoft Media Foundation video rendering sink.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfdxgidevicemanagersource
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFDXGIDeviceManagerSource extends IUnknown{
    /**
     * The interface identifier for IMFDXGIDeviceManagerSource
     * @type {Guid}
     */
    static IID => Guid("{20bc074b-7a8d-4609-8c3b-64a0a3b5d7ce}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMFDXGIDeviceManager>} ppManager 
     * @returns {HRESULT} 
     */
    GetManager(ppManager) {
        result := ComCall(3, this, "ptr", ppManager, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
