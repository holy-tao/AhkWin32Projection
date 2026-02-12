#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\WindowingEnvironment.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class IWindowingEnvironmentStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowingEnvironmentStatics
     * @type {Guid}
     */
    static IID => Guid("{874e9fb7-c642-55ab-8aa2-162f734a9a72}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindAll", "FindAllWithKind"]

    /**
     * 
     * @returns {IVectorView<WindowingEnvironment>} 
     */
    FindAll() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(WindowingEnvironment, result_)
    }

    /**
     * 
     * @param {Integer} kind 
     * @returns {IVectorView<WindowingEnvironment>} 
     */
    FindAllWithKind(kind) {
        result := ComCall(7, this, "int", kind, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(WindowingEnvironment, result_)
    }
}
