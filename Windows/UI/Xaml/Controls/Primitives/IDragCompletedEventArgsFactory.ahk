#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\DragCompletedEventArgs.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IDragCompletedEventArgsFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDragCompletedEventArgsFactory
     * @type {Guid}
     */
    static IID => Guid("{36a7d99d-148c-495f-a0fc-afc871d62f33}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstanceWithHorizontalChangeVerticalChangeAndCanceled"]

    /**
     * 
     * @param {Float} horizontalChange 
     * @param {Float} verticalChange 
     * @param {Boolean} canceled 
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {DragCompletedEventArgs} 
     */
    CreateInstanceWithHorizontalChangeVerticalChangeAndCanceled(horizontalChange, verticalChange, canceled, baseInterface, innerInterface) {
        result := ComCall(6, this, "double", horizontalChange, "double", verticalChange, "int", canceled, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DragCompletedEventArgs(value)
    }
}
