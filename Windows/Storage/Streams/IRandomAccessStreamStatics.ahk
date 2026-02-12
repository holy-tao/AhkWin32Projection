#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class IRandomAccessStreamStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRandomAccessStreamStatics
     * @type {Guid}
     */
    static IID => Guid("{524cedcf-6e29-4ce5-9573-6b753db66c3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CopyAsync", "CopySizeAsync", "CopyAndCloseAsync"]

    /**
     * 
     * @param {IInputStream} source 
     * @param {IOutputStream} destination 
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     */
    CopyAsync(source, destination) {
        result := ComCall(6, this, "ptr", source, "ptr", destination, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress((ptr) => IPropertyValue(ptr).GetUInt64(), (ptr) => IPropertyValue(ptr).GetUInt64(), operation)
    }

    /**
     * 
     * @param {IInputStream} source 
     * @param {IOutputStream} destination 
     * @param {Integer} bytesToCopy 
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     */
    CopySizeAsync(source, destination, bytesToCopy) {
        result := ComCall(7, this, "ptr", source, "ptr", destination, "uint", bytesToCopy, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress((ptr) => IPropertyValue(ptr).GetUInt64(), (ptr) => IPropertyValue(ptr).GetUInt64(), operation)
    }

    /**
     * 
     * @param {IInputStream} source 
     * @param {IOutputStream} destination 
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     */
    CopyAndCloseAsync(source, destination) {
        result := ComCall(8, this, "ptr", source, "ptr", destination, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress((ptr) => IPropertyValue(ptr).GetUInt64(), (ptr) => IPropertyValue(ptr).GetUInt64(), operation)
    }
}
