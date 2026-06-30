#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\Location.ahk
#Include ..\..\..\Variant\VARIANT.ahk
#Include .\LocationKind.ahk
#Include .\IDebugHostSymbol.ahk
#Include ..\..\..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class IDebugHostField extends IDebugHostSymbol {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostField
     * @type {Guid}
     */
    static IID => Guid("{e06f6495-16bc-4cc9-b11d-2a6b23fa72f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLocationKind", "GetOffset", "GetLocation", "GetValue"]

    /**
     * 
     * @returns {LocationKind} 
     */
    GetLocationKind() {
        result := ComCall(10, this, "int*", &_locationKind := 0, "HRESULT")
        return _locationKind
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetOffset() {
        result := ComCall(11, this, "uint*", &offset := 0, "HRESULT")
        return offset
    }

    /**
     * 
     * @returns {Location} 
     */
    GetLocation() {
        _location := Location()
        result := ComCall(12, this, "ptr", _location, "HRESULT")
        return _location
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    GetValue() {
        value := VARIANT()
        result := ComCall(13, this, "ptr", value, "HRESULT")
        return value
    }
}
