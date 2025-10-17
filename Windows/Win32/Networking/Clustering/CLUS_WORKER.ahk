#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Contains information about a worker thread.
 * @remarks
 * 
  * A worker thread is a thread that is created to offload work from a main thread so that the main thread is not blocked.
  * 
  * A  <b>CLUS_WORKER</b> structure is returned as output from  <a href="https://docs.microsoft.com/windows/desktop/api/resapi/nf-resapi-clusworkercreate">ClusWorkerCreate</a> and passed as input to  <a href="https://docs.microsoft.com/windows/desktop/api/resapi/nf-resapi-clusworkercheckterminate">ClusWorkerCheckTerminate</a> and  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pclusapi_clus_worker_terminate">ClusWorkerTerminate</a>. There is never any reason for an application or  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dlls">resource DLL</a> to alter the members of a  <b>CLUS_WORKER</b> structure. This structure should always be treated as read-only.
  * 
  * The 
  * <b>Terminate</b> member prevents a potential race condition that can occur if multiple threads call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pclusapi_clus_worker_terminate">ClusWorkerTerminate</a> function to end the same worker thread. The first call sets 
  * <b>Terminate</b> to <b>TRUE</b>. Subsequent calls return immediately after checking the value of 
  * <b>Terminate</b> without waiting for the thread to exit.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//resapi/ns-resapi-clus_worker
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_WORKER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Handle to the worker thread.
     * @type {HANDLE}
     */
    hThread{
        get {
            if(!this.HasProp("__hThread"))
                this.__hThread := HANDLE(0, this)
            return this.__hThread
        }
    }

    /**
     * Flag that indicates whether the thread is to be terminated.
     * @type {BOOL}
     */
    Terminate {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
