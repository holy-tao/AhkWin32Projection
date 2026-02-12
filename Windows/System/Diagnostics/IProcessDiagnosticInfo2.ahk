#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\AppDiagnosticInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class IProcessDiagnosticInfo2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProcessDiagnosticInfo2
     * @type {Guid}
     */
    static IID => Guid("{9558cb1a-3d0b-49ec-ab70-4f7a112805de}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAppDiagnosticInfos", "get_IsPackaged"]

    /**
     * @type {Boolean} 
     */
    IsPackaged {
        get => this.get_IsPackaged()
    }

    /**
     * 
     * @returns {IVector<AppDiagnosticInfo>} 
     */
    GetAppDiagnosticInfos() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(AppDiagnosticInfo, result_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPackaged() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
