#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement.Core
 * @version WindowsRuntime 1.4
 */
class ICoreInputViewOcclusion extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreInputViewOcclusion
     * @type {Guid}
     */
    static IID => Guid("{cc36ce06-3865-4177-b5f5-8b65e0b9ce84}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OccludingRect", "get_OcclusionKind"]

    /**
     * @type {RECT} 
     */
    OccludingRect {
        get => this.get_OccludingRect()
    }

    /**
     * @type {Integer} 
     */
    OcclusionKind {
        get => this.get_OcclusionKind()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_OccludingRect() {
        value := RECT()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OcclusionKind() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
