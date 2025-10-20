#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostMemory extends IUnknown{
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
     * 
     * @param {Pointer<IDebugHostContext>} context 
     * @param {Location} location 
     * @param {Pointer} buffer 
     * @param {Integer} bufferSize 
     * @param {Pointer<UInt64>} bytesRead 
     * @returns {HRESULT} 
     */
    ReadBytes(context, location, buffer, bufferSize, bytesRead) {
        result := ComCall(3, this, "ptr", context, "ptr", location, "ptr", buffer, "uint", bufferSize, "uint*", bytesRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostContext>} context 
     * @param {Location} location 
     * @param {Pointer} buffer 
     * @param {Integer} bufferSize 
     * @param {Pointer<UInt64>} bytesWritten 
     * @returns {HRESULT} 
     */
    WriteBytes(context, location, buffer, bufferSize, bytesWritten) {
        result := ComCall(4, this, "ptr", context, "ptr", location, "ptr", buffer, "uint", bufferSize, "uint*", bytesWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostContext>} context 
     * @param {Location} location 
     * @param {Integer} count 
     * @param {Pointer<UInt64>} pointers 
     * @returns {HRESULT} 
     */
    ReadPointers(context, location, count, pointers) {
        result := ComCall(5, this, "ptr", context, "ptr", location, "uint", count, "uint*", pointers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostContext>} context 
     * @param {Location} location 
     * @param {Integer} count 
     * @param {Pointer<UInt64>} pointers 
     * @returns {HRESULT} 
     */
    WritePointers(context, location, count, pointers) {
        result := ComCall(6, this, "ptr", context, "ptr", location, "uint", count, "uint*", pointers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostContext>} context 
     * @param {Location} location 
     * @param {Integer} verbose 
     * @param {Pointer<BSTR>} locationName 
     * @returns {HRESULT} 
     */
    GetDisplayStringForLocation(context, location, verbose, locationName) {
        result := ComCall(7, this, "ptr", context, "ptr", location, "char", verbose, "ptr", locationName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
