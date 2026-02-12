#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\IAsyncOperation.ahk
#Include .\ErrorDetails.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class IErrorDetailsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IErrorDetailsStatics
     * @type {Guid}
     */
    static IID => Guid("{b7703750-0b1d-46c8-aa0e-4b8178e4fce9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromHResultAsync"]

    /**
     * 
     * @param {Integer} errorCode 
     * @returns {IAsyncOperation<ErrorDetails>} 
     */
    CreateFromHResultAsync(errorCode) {
        result := ComCall(6, this, "int", errorCode, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ErrorDetails, operation)
    }
}
