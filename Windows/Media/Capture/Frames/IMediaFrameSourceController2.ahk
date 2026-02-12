#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\MediaFrameSourceGetPropertyResult.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class IMediaFrameSourceController2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaFrameSourceController2
     * @type {Guid}
     */
    static IID => Guid("{efc49fd4-fcf2-4a03-b4e4-ac9628739bee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyByExtendedIdAsync", "SetPropertyByExtendedIdAsync"]

    /**
     * 
     * @param {Integer} extendedPropertyId_length 
     * @param {Pointer<Integer>} extendedPropertyId 
     * @param {IReference<Integer>} maxPropertyValueSize 
     * @returns {IAsyncOperation<MediaFrameSourceGetPropertyResult>} 
     */
    GetPropertyByExtendedIdAsync(extendedPropertyId_length, extendedPropertyId, maxPropertyValueSize) {
        extendedPropertyIdMarshal := extendedPropertyId is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "uint", extendedPropertyId_length, extendedPropertyIdMarshal, extendedPropertyId, "ptr", maxPropertyValueSize, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MediaFrameSourceGetPropertyResult, operation)
    }

    /**
     * 
     * @param {Integer} extendedPropertyId_length 
     * @param {Pointer<Integer>} extendedPropertyId 
     * @param {Integer} propertyValue_length 
     * @param {Pointer<Integer>} propertyValue 
     * @returns {IAsyncOperation<Integer>} 
     */
    SetPropertyByExtendedIdAsync(extendedPropertyId_length, extendedPropertyId, propertyValue_length, propertyValue) {
        extendedPropertyIdMarshal := extendedPropertyId is VarRef ? "char*" : "ptr"
        propertyValueMarshal := propertyValue is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "uint", extendedPropertyId_length, extendedPropertyIdMarshal, extendedPropertyId, "uint", propertyValue_length, propertyValueMarshal, propertyValue, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }
}
