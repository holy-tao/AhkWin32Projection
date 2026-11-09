#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include ..\Com\IUnknown.ahk
#Include .\WTSWindowInfo.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class IWTSWindowChangedCallback extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWTSWindowChangedCallback
     * @type {Guid}
     */
    static IID => Guid("{e8a47fd3-1af6-4d7f-8e15-515ccae1c00c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WindowChanged"]

    /**
     * @param {Pointer<WTSWindowInfo>} _windowInfo 
     * @returns {HRESULT} 
     */
    WindowChanged(_windowInfo) {
        result := ComCall(3, this, "ptr", _windowInfo, "HRESULT")
        return result
    }
}
