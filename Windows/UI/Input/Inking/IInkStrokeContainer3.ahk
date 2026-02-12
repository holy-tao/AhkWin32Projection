#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\InkStroke.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkStrokeContainer3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkStrokeContainer3
     * @type {Guid}
     */
    static IID => Guid("{3d07bea5-baea-4c82-a719-7b83da1067d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SaveWithFormatAsync", "GetStrokeById"]

    /**
     * 
     * @param {IOutputStream} outputStream 
     * @param {Integer} inkPersistenceFormat_ 
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     */
    SaveWithFormatAsync(outputStream, inkPersistenceFormat_) {
        result := ComCall(6, this, "ptr", outputStream, "int", inkPersistenceFormat_, "ptr*", &outputStreamOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress((ptr) => IPropertyValue(ptr).GetUInt32(), (ptr) => IPropertyValue(ptr).GetUInt32(), outputStreamOperation)
    }

    /**
     * 
     * @param {Integer} id 
     * @returns {InkStroke} 
     */
    GetStrokeById(id) {
        result := ComCall(7, this, "uint", id, "ptr*", &stroke := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkStroke(stroke)
    }
}
