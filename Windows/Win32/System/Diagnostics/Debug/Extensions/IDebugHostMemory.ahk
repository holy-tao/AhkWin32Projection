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
     * @param {IDebugHostContext} context_ 
     * @param {Location} location_ 
     * @param {Pointer} buffer_ 
     * @param {Integer} bufferSize 
     * @returns {Integer} 
     */
    ReadBytes(context_, location_, buffer_, bufferSize) {
        result := ComCall(3, this, "ptr", context_, "ptr", location_, "ptr", buffer_, "uint", bufferSize, "uint*", &bytesRead := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bytesRead
    }

    /**
     * 
     * @param {IDebugHostContext} context_ 
     * @param {Location} location_ 
     * @param {Pointer} buffer_ 
     * @param {Integer} bufferSize 
     * @returns {Integer} 
     */
    WriteBytes(context_, location_, buffer_, bufferSize) {
        result := ComCall(4, this, "ptr", context_, "ptr", location_, "ptr", buffer_, "uint", bufferSize, "uint*", &bytesWritten := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bytesWritten
    }

    /**
     * 
     * @param {IDebugHostContext} context_ 
     * @param {Location} location_ 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    ReadPointers(context_, location_, count) {
        result := ComCall(5, this, "ptr", context_, "ptr", location_, "uint", count, "uint*", &pointers := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pointers
    }

    /**
     * 
     * @param {IDebugHostContext} context_ 
     * @param {Location} location_ 
     * @param {Integer} count 
     * @param {Pointer<Integer>} pointers 
     * @returns {HRESULT} 
     */
    WritePointers(context_, location_, count, pointers) {
        pointersMarshal := pointers is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", context_, "ptr", location_, "uint", count, pointersMarshal, pointers, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IDebugHostContext} context_ 
     * @param {Location} location_ 
     * @param {Integer} verbose 
     * @returns {BSTR} 
     */
    GetDisplayStringForLocation(context_, location_, verbose) {
        locationName := BSTR()
        result := ComCall(7, this, "ptr", context_, "ptr", location_, "char", verbose, "ptr", locationName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return locationName
    }
}
