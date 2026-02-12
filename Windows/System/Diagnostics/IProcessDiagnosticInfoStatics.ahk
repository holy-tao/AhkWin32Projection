#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ProcessDiagnosticInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class IProcessDiagnosticInfoStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProcessDiagnosticInfoStatics
     * @type {Guid}
     */
    static IID => Guid("{2f41b260-b49f-428c-aa0e-84744f49ca95}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForProcesses", "GetForCurrentProcess"]

    /**
     * 
     * @returns {IVectorView<ProcessDiagnosticInfo>} 
     */
    GetForProcesses() {
        result := ComCall(6, this, "ptr*", &processes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ProcessDiagnosticInfo, processes)
    }

    /**
     * 
     * @returns {ProcessDiagnosticInfo} 
     */
    GetForCurrentProcess() {
        result := ComCall(7, this, "ptr*", &processes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProcessDiagnosticInfo(processes)
    }
}
