#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\ApplicationModel\DataTransfer\DataPackageView.ahk
#Include .\DragUIOverride.ahk
#Include .\DragOperationDeferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IDragEventArgs2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDragEventArgs2
     * @type {Guid}
     */
    static IID => Guid("{26336658-2917-411d-bfc3-2f22471cbbe7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DataView", "get_DragUIOverride", "get_Modifiers", "get_AcceptedOperation", "put_AcceptedOperation", "GetDeferral"]

    /**
     * @type {DataPackageView} 
     */
    DataView {
        get => this.get_DataView()
    }

    /**
     * @type {DragUIOverride} 
     */
    DragUIOverride {
        get => this.get_DragUIOverride()
    }

    /**
     * @type {Integer} 
     */
    Modifiers {
        get => this.get_Modifiers()
    }

    /**
     * @type {Integer} 
     */
    AcceptedOperation {
        get => this.get_AcceptedOperation()
        set => this.put_AcceptedOperation(value)
    }

    /**
     * 
     * @returns {DataPackageView} 
     */
    get_DataView() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataPackageView(value)
    }

    /**
     * 
     * @returns {DragUIOverride} 
     */
    get_DragUIOverride() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DragUIOverride(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Modifiers() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AcceptedOperation() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AcceptedOperation(value) {
        result := ComCall(10, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DragOperationDeferral} 
     */
    GetDeferral() {
        result := ComCall(11, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DragOperationDeferral(result_)
    }
}
