#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\InitialValueExpressionCollection.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionAnimation3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionAnimation3
     * @type {Guid}
     */
    static IID => Guid("{d51e030d-7da4-4bd7-bc2d-f4517529f43a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InitialValueExpressions"]

    /**
     * @type {InitialValueExpressionCollection} 
     */
    InitialValueExpressions {
        get => this.get_InitialValueExpressions()
    }

    /**
     * 
     * @returns {InitialValueExpressionCollection} 
     */
    get_InitialValueExpressions() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InitialValueExpressionCollection(value)
    }
}
