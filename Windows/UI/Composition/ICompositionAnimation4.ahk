#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionAnimation4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionAnimation4
     * @type {Guid}
     */
    static IID => Guid("{770137be-76bc-4e23-bfed-fe9cc20f6ec9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetExpressionReferenceParameter"]

    /**
     * 
     * @param {HSTRING} parameterName 
     * @param {IAnimationObject} source 
     * @returns {HRESULT} 
     */
    SetExpressionReferenceParameter(parameterName, source) {
        if(parameterName is String) {
            pin := HSTRING.Create(parameterName)
            parameterName := pin.Value
        }
        parameterName := parameterName is Win32Handle ? NumGet(parameterName, "ptr") : parameterName

        result := ComCall(6, this, "ptr", parameterName, "ptr", source, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
