#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides the ability to serialize/deserialize an IPropertySet to an IBuffer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.ipropertysetserializer
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class IPropertySetSerializer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertySetSerializer
     * @type {Guid}
     */
    static IID => Guid("{6e8ebf1c-ef3d-4376-b20e-5be638aeac77}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Serialize", "Deserialize"]

    /**
     * Serializes an IPropertySet to an IBuffer.
     * @param {IPropertySet} propertySet_ The IPropertySet to serialize.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.ipropertysetserializer.serialize
     */
    Serialize(propertySet_) {
        result := ComCall(6, this, "ptr", propertySet_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(result_)
    }

    /**
     * Deserializes an IPropertySet from an IBuffer.
     * @remarks
     * Returns the IPropertySet result of the deserialization.
     * @param {IPropertySet} propertySet_ The IPropertySet to deserialize.
     * @param {IBuffer} buffer_ The IBuffer containing a serialized IPropertySet that needs to be deserialized.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.ipropertysetserializer.deserialize
     */
    Deserialize(propertySet_, buffer_) {
        result := ComCall(7, this, "ptr", propertySet_, "ptr", buffer_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
