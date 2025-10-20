#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables registration of an apartment shutdown notification handler.
 * @remarks
 * 
  * Implement the <b>IApartmentShutdown</b> interface to use the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/nf-roapi-roregisterforapartmentshutdown">RoRegisterForApartmentShutdown</a> function.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-iapartmentshutdown
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IApartmentShutdown extends IUnknown{
    /**
     * The interface identifier for IApartmentShutdown
     * @type {Guid}
     */
    static IID => Guid("{a2f05a09-27a2-42b5-bc0e-ac163ef49d9b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} ui64ApartmentIdentifier 
     * @returns {String} Nothing - always returns an empty string
     */
    OnUninitialize(ui64ApartmentIdentifier) {
        ComCall(3, this, "uint", ui64ApartmentIdentifier)
        return result
    }
}
