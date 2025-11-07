#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostMemory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostMemory
     * @type {Guid}
     */
    static IID => Guid("{212149c9-9183-4a3e-b00e-4fd1dc95339b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadBytes", "WriteBytes", "ReadPointers", "WritePointers", "GetDisplayStringForLocation"]

    /**
     * 
     * @param {IDebugHostContext} context 
     * @param {Location} location 
     * @param {Pointer} buffer 
     * @param {Integer} bufferSize 
     * @returns {Integer} 
     */
    ReadBytes(context, location, buffer, bufferSize) {
        result := ComCall(3, this, "ptr", context, "ptr", location, "ptr", buffer, "uint", bufferSize, "uint*", &bytesRead := 0, "HRESULT")
        return bytesRead
    }

    /**
     * 
     * @param {IDebugHostContext} context 
     * @param {Location} location 
     * @param {Pointer} buffer 
     * @param {Integer} bufferSize 
     * @returns {Integer} 
     */
    WriteBytes(context, location, buffer, bufferSize) {
        result := ComCall(4, this, "ptr", context, "ptr", location, "ptr", buffer, "uint", bufferSize, "uint*", &bytesWritten := 0, "HRESULT")
        return bytesWritten
    }

    /**
     * 
     * @param {IDebugHostContext} context 
     * @param {Location} location 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    ReadPointers(context, location, count) {
        result := ComCall(5, this, "ptr", context, "ptr", location, "uint", count, "uint*", &pointers := 0, "HRESULT")
        return pointers
    }

    /**
     * 
     * @param {IDebugHostContext} context 
     * @param {Location} location 
     * @param {Integer} count 
     * @param {Pointer<Integer>} pointers 
     * @returns {HRESULT} 
     */
    WritePointers(context, location, count, pointers) {
        pointersMarshal := pointers is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", context, "ptr", location, "uint", count, pointersMarshal, pointers, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugHostContext} context 
     * @param {Location} location 
     * @param {Integer} verbose 
     * @returns {BSTR} 
     */
    GetDisplayStringForLocation(context, location, verbose) {
        locationName := BSTR()
        result := ComCall(7, this, "ptr", context, "ptr", location, "char", verbose, "ptr", locationName, "HRESULT")
        return locationName
    }
}
