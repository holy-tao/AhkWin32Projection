#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IBindStatusCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBindStatusCallback
     * @type {Guid}
     */
    static IID => Guid("{79eac9c1-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnStartBinding", "GetPriority", "OnLowResource", "OnProgress", "OnStopBinding", "GetBindInfo", "OnDataAvailable", "OnObjectAvailable"]

    /**
     * 
     * @param {Integer} dwReserved 
     * @param {IBinding} pib 
     * @returns {HRESULT} 
     */
    OnStartBinding(dwReserved, pib) {
        result := ComCall(3, this, "uint", dwReserved, "ptr", pib, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the priority class for the specified process. This value, together with the priority value of each thread of the process, determines each thread's base priority level.
     * @remarks
     * Every thread has a base priority level determined by the thread's priority value and the priority class of its process. The operating system uses the base priority level of all executable threads to determine which thread gets the next slice of CPU time. Threads are scheduled in a round-robin fashion at each priority level, and only when there are no executable threads at a higher level will scheduling of threads at a lower level take place.
     * 
     * For a table that shows the base priority levels for each combination of priority class and thread priority value, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/scheduling-priorities">Scheduling Priorities</a>.
     * 
     * Priority class is maintained by the executive, so all processes have a priority class that can be queried.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/processthreadsapi/nf-processthreadsapi-getpriorityclass
     */
    GetPriority() {
        result := ComCall(4, this, "int*", &pnPriority := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pnPriority
    }

    /**
     * 
     * @param {Integer} reserved 
     * @returns {HRESULT} 
     */
    OnLowResource(reserved) {
        result := ComCall(5, this, "uint", reserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} ulProgress 
     * @param {Integer} ulProgressMax 
     * @param {Integer} ulStatusCode 
     * @param {PWSTR} szStatusText 
     * @returns {HRESULT} 
     */
    OnProgress(ulProgress, ulProgressMax, ulStatusCode, szStatusText) {
        szStatusText := szStatusText is String ? StrPtr(szStatusText) : szStatusText

        result := ComCall(6, this, "uint", ulProgress, "uint", ulProgressMax, "uint", ulStatusCode, "ptr", szStatusText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HRESULT} hresult_ 
     * @param {PWSTR} szError 
     * @returns {HRESULT} 
     */
    OnStopBinding(hresult_, szError) {
        szError := szError is String ? StrPtr(szError) : szError

        result := ComCall(7, this, "int", hresult_, "ptr", szError, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<BINDINFO>} pbindinfo 
     * @returns {Integer} 
     */
    GetBindInfo(pbindinfo) {
        result := ComCall(8, this, "uint*", &grfBINDF := 0, "ptr", pbindinfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return grfBINDF
    }

    /**
     * 
     * @param {Integer} grfBSCF 
     * @param {Integer} dwSize 
     * @param {Pointer<FORMATETC>} pformatetc 
     * @param {Pointer<STGMEDIUM>} pstgmed 
     * @returns {HRESULT} 
     */
    OnDataAvailable(grfBSCF, dwSize, pformatetc, pstgmed) {
        result := ComCall(9, this, "uint", grfBSCF, "uint", dwSize, "ptr", pformatetc, "ptr", pstgmed, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     */
    OnObjectAvailable(riid, punk) {
        result := ComCall(10, this, "ptr", riid, "ptr", punk, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
