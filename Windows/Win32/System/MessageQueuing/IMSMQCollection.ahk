#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQCollection
     * @type {Guid}
     */
    static IID => Guid("{0188ac2f-ecb3-4173-9779-635ca2039c72}")

    /**
     * The class identifier for MSMQCollection
     * @type {Guid}
     */
    static CLSID => Guid("{f72b9031-2f0c-43e8-924e-e6052cdc493f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Item", "get_Count", "_NewEnum"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Index 
     * @returns {VARIANT} 
     */
    Item(Index) {
        pvarRet := VARIANT()
        result := ComCall(7, this, "ptr", Index, "ptr", pvarRet, "HRESULT")
        return pvarRet
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(8, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    _NewEnum() {
        result := ComCall(9, this, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }
}
