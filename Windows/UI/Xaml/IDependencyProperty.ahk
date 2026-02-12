#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PropertyMetadata.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IDependencyProperty extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDependencyProperty
     * @type {Guid}
     */
    static IID => Guid("{85b13970-9bc4-4e96-acf1-30c8fd3d55c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMetadata"]

    /**
     * 
     * @param {TypeName} forType 
     * @returns {PropertyMetadata} 
     */
    GetMetadata(forType) {
        result := ComCall(6, this, "ptr", forType, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PropertyMetadata(result_)
    }
}
