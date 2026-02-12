#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\InkModelerAttributes.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkDrawingAttributes5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkDrawingAttributes5
     * @type {Guid}
     */
    static IID => Guid("{d11aa0bb-0775-4852-ae64-41143a7ae6c9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ModelerAttributes"]

    /**
     * @type {InkModelerAttributes} 
     */
    ModelerAttributes {
        get => this.get_ModelerAttributes()
    }

    /**
     * 
     * @returns {InkModelerAttributes} 
     */
    get_ModelerAttributes() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkModelerAttributes(value)
    }
}
