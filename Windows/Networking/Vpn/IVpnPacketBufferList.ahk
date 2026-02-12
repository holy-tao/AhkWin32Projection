#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\VpnPacketBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnPacketBufferList extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnPacketBufferList
     * @type {Guid}
     */
    static IID => Guid("{c2f891fc-4d5c-4a63-b70d-4e307eacce77}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Append", "AddAtBegin", "RemoveAtEnd", "RemoveAtBegin", "Clear", "put_Status", "get_Status", "get_Size"]

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
        set => this.put_Status(value)
    }

    /**
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * Append geometry-shader-output data to an existing stream.
     * @param {VpnPacketBuffer} nextVpnPacketBuffer 
     * @returns {HRESULT} | Item                                                                                                                             | Description                                                                                                                                            |
     * |----------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="StreamDataType"></span><span id="streamdatatype"></span><span id="STREAMDATATYPE"></span>**StreamDataType**<br/> | A data input description. This description must match the stream-object template parameter called [DataType](dx-graphics-hlsl-so-type.md).<br/> |
     * 
     * 
     * 
     *  
     * 
     * 
     * None
     * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3dhlsl/dx-graphics-hlsl-so-append
     */
    Append(nextVpnPacketBuffer) {
        result := ComCall(6, this, "ptr", nextVpnPacketBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VpnPacketBuffer} nextVpnPacketBuffer 
     * @returns {HRESULT} 
     */
    AddAtBegin(nextVpnPacketBuffer) {
        result := ComCall(7, this, "ptr", nextVpnPacketBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VpnPacketBuffer} 
     */
    RemoveAtEnd() {
        result := ComCall(8, this, "ptr*", &nextVpnPacketBuffer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VpnPacketBuffer(nextVpnPacketBuffer)
    }

    /**
     * 
     * @returns {VpnPacketBuffer} 
     */
    RemoveAtBegin() {
        result := ComCall(9, this, "ptr*", &nextVpnPacketBuffer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VpnPacketBuffer(nextVpnPacketBuffer)
    }

    /**
     * Clear Method (ADO)
     * @remarks
     * Use the **Clear** method on the [Errors](./errors-collection-ado.md) collection to remove all existing [Error](./error-object.md) objects from the collection. When an error occurs, ADO automatically clears the **Errors** collection and fills it with **Error** objects based on the new error.  
     *   
     *  Some properties and methods return warnings that appear as **Error** objects in the **Errors** collection but do not halt a program's execution. Before you call the [Resync](./resync-method.md), [UpdateBatch](./updatebatch-method.md), or [CancelBatch](./cancelbatch-method-ado.md) methods on a [Recordset](./recordset-object-ado.md) object; the [Open](./open-method-ado-connection.md) method on a [Connection](./connection-object-ado.md) object; or set the [Filter](./filter-property.md) property on a **Recordset** object, call the **Clear** method on the **Errors** collection. That way, you can read the [Count](./count-property-ado.md) property of the **Errors** collection to test for returned warnings.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/clear-method-ado
     */
    Clear() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Status(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        result := ComCall(13, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
