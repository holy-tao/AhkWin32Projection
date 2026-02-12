#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CompositionObject.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IAnimationPropertyInfo2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAnimationPropertyInfo2
     * @type {Guid}
     */
    static IID => Guid("{591720b4-7472-5218-8b39-dffe615ae6da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetResolvedCompositionObject", "GetResolvedCompositionObjectProperty"]

    /**
     * 
     * @returns {CompositionObject} 
     */
    GetResolvedCompositionObject() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionObject(result_)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetResolvedCompositionObjectProperty() {
        result_ := HSTRING()
        result := ComCall(7, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
