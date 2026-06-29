#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ICLRIoCompletionManager.ahk" { ICLRIoCompletionManager }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct IHostIoCompletionManager extends IUnknown {
    /**
     * The interface identifier for IHostIoCompletionManager
     * @type {Guid}
     */
    static IID := Guid("{8bde9d80-ec06-41d6-83e6-22580effcc20}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHostIoCompletionManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateIoCompletionPort    : IntPtr
        CloseIoCompletionPort     : IntPtr
        SetMaxThreads             : IntPtr
        GetMaxThreads             : IntPtr
        GetAvailableThreads       : IntPtr
        GetHostOverlappedSize     : IntPtr
        SetCLRIoCompletionManager : IntPtr
        InitializeHostOverlapped  : IntPtr
        Bind                      : IntPtr
        SetMinThreads             : IntPtr
        GetMinThreads             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHostIoCompletionManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an input/output (I/O) completion port and associates it with a specified file handle, or creates an I/O completion port that is not yet associated with a file handle, allowing association at a later time.
     * @remarks
     * The I/O system can be instructed to send I/O completion notification packets to I/O completion ports, where they are queued. The 
     * <b>CreateIoCompletionPort</b> function provides this functionality.
     * 
     * An I/O completion port and its handle are associated with the process that created it and is not sharable between processes. However, a single handle is sharable between threads in the same process.
     * 
     * <b>CreateIoCompletionPort</b> can be used in three distinct modes:
     * 
     * <ul>
     * <li>Create only an I/O completion port without associating it with a file handle. </li>
     * <li>Associate an existing I/O completion port with a file handle.</li>
     * <li>Perform both creation and association in a single call.</li>
     * </ul>
     * To create an I/O completion port without associating it, set the <i>FileHandle</i> parameter to <b>INVALID_HANDLE_VALUE</b>, the <i>ExistingCompletionPort</i> parameter to <b>NULL</b>, and the <i>CompletionKey</i> parameter to zero (which is ignored in this case). Set the <i>NumberOfConcurrentThreads</i> parameter to the desired concurrency value for the new I/O completion port, or zero for the default (the number of processors in the system).
     * 
     * The handle passed in the <i>FileHandle</i> parameter can be any handle that supports overlapped I/O. Most commonly, this is a handle opened by the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function using the <b>FILE_FLAG_OVERLAPPED</b> flag (for example, files, mail slots, and pipes). Objects created by other functions such as <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-socket">socket</a> can also be associated with an I/O completion port. For an example using sockets, see <a href="https://docs.microsoft.com/windows/desktop/api/mswsock/nf-mswsock-acceptex">AcceptEx</a>. A handle can be associated with only one I/O completion port, and after the association is made, the handle remains associated with that I/O completion port until it is closed.
     * 
     * For more information on I/O completion port theory, usage, and associated functions, see <a href="https://docs.microsoft.com/windows/desktop/FileIO/i-o-completion-ports">I/O Completion Ports</a>.
     * 
     * Multiple file handles can be associated with a single I/O completion port by calling <b>CreateIoCompletionPort</b> multiple times with the same I/O completion port handle in the <i>ExistingCompletionPort</i> parameter and a different file handle in the <i>FileHandle</i> parameter each time.
     * 
     * Use the <i>CompletionKey</i> parameter to help your application track which I/O operations have completed. This value is not used by <b>CreateIoCompletionPort</b> for functional control; rather, it is attached to the file handle specified in the <i>FileHandle</i> parameter at the time of association with an I/O completion port. This completion key should be unique for each file handle, and it accompanies the file handle throughout the internal completion queuing process. It is returned in the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> function call when a completion packet arrives. The <i>CompletionKey</i> parameter is also used by the <a href="https://docs.microsoft.com/windows/desktop/FileIO/postqueuedcompletionstatus">PostQueuedCompletionStatus</a> function to queue your own special-purpose completion packets.
     * 
     * After an instance of an open handle is associated with an I/O completion port, it cannot be used in the 
     *                 <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfileex">ReadFileEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-writefileex">WriteFileEx</a> function because these functions have their own asynchronous I/O mechanisms. 
     * 
     * It is best not to share a file handle associated with an I/O completion port by using either handle inheritance or a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-duplicatehandle">DuplicateHandle</a> function. Operations performed with such duplicate handles generate completion notifications. Careful consideration is advised.
     * 
     * The I/O completion port handle and every file handle associated with that particular I/O completion port are known as <i>references to the I/O completion port</i>. The I/O completion port is released when there are no more references to it. Therefore, all of these handles must be properly closed to release the I/O completion port and its associated system resources. After these conditions are satisfied, close the I/O completion port handle by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function.
     * 
     * In Windows 8 and Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-createiocompletionport
     */
    CreateIoCompletionPort() {
        phPort := HANDLE.Owned()
        result := ComCall(3, this, HANDLE.Ptr, phPort, "HRESULT")
        return phPort
    }

    /**
     * 
     * @param {HANDLE} hPort 
     * @returns {HRESULT} 
     */
    CloseIoCompletionPort(hPort) {
        result := ComCall(4, this, HANDLE, hPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMaxIOCompletionThreads 
     * @returns {HRESULT} 
     */
    SetMaxThreads(dwMaxIOCompletionThreads) {
        result := ComCall(5, this, "uint", dwMaxIOCompletionThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMaxThreads() {
        result := ComCall(6, this, "uint*", &pdwMaxIOCompletionThreads := 0, "HRESULT")
        return pdwMaxIOCompletionThreads
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetAvailableThreads() {
        result := ComCall(7, this, "uint*", &pdwAvailableIOCompletionThreads := 0, "HRESULT")
        return pdwAvailableIOCompletionThreads
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetHostOverlappedSize() {
        result := ComCall(8, this, "uint*", &pcbSize := 0, "HRESULT")
        return pcbSize
    }

    /**
     * 
     * @param {ICLRIoCompletionManager} pManager 
     * @returns {HRESULT} 
     */
    SetCLRIoCompletionManager(pManager) {
        result := ComCall(9, this, "ptr", pManager, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvOverlapped 
     * @returns {HRESULT} 
     */
    InitializeHostOverlapped(pvOverlapped) {
        pvOverlappedMarshal := pvOverlapped is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, pvOverlappedMarshal, pvOverlapped, "HRESULT")
        return result
    }

    /**
     * A set of string keys that are used with the IBindCtx::RegisterObjectParam method to specify a bind context.
     * @remarks
     * Bind contexts are used to pass optional parameters to functions that have an IBindCtx\* parameter. Those parameters are expressed as COM objects and might implement interfaces that are used to model the parameter data. Some bind contexts represent a Boolean value, where **TRUE** indicates an object that implements only [**IUnknown**](/windows/win32/api/unknwn/nn-unknwn-iunknown) and FALSE indicates no object is present.
     * 
     * [**IShellFolder::ParseDisplayName**](/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-parsedisplayname), [**IShellFolder::BindToObject**](/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-bindtoobject) and [**IShellItem::BindToHandler**](/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem-bindtohandler) take a bind context and you can pass them parameters through that bind context.
     * 
     * Some bind contexts are specific to a certain data source implementations or handler types.
     * 
     * Bind context parameters are defined for use with a specific function or method.
     * 
     * When requesting a property store through [**IShellFolder**](/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellfolder), you can specify the equivalent of [**GPS\_DEFAULT**](/windows/win32/api/propsys/ne-propsys-getpropertystoreflags) by passing in a null [**IBindCtx**](/windows/win32/api/objidl/nn-objidl-ibindctx) parameter. You can also specify the equivalent of GPS\_READWRITE by passing a mode of STGM\_READWRITE \| STGM\_EXCLUSIVE in the bind context.
     * 
     * The property bag specified by the **STR\_PROPERTYBAG\_PARAM** bind context object contains additional values that you can access with the [**IPropertyBag::Read**](/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768197(v=vs.85)) and [**IPropertyBag::Write**](/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768198(v=vs.85)) methods.
     * 
     * 
     * 
     * | Property name                                 | Type     | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
     * |-----------------------------------------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | STR\_ENUM\_ITEMS\_FLAGS                       | VT\_UI4  | **Introduced in Windows 8**. Specifies a [**SHCONTF**](/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shcontf) value to be passed to [**IShellFolder::EnumObjects**](/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-enumobjects) when you call [**IShellItem::BindToHandler**](/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem-bindtohandler) with **BHID\_EnumItems**.                                                                                                                                                                                                                         |
     * | STR\_PARSE\_EXPLICIT\_ASSOCIATION\_SUCCESSFUL | VT\_BOOL | **Introduced in Windows 7**. The [**IShellFolder::ParseDisplayName**](/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-parsedisplayname) method sets this property to tell the caller that the returned IDList was bound to the [ProgID](fa-progids.md) specified with **STR\_PARSE\_WITH\_EXPLICIT\_PROGID** or the application specified with **STR\_PARSE\_WITH\_EXPLICIT\_ASSOCAPP**. When **STR\_PARSE\_EXPLICIT\_ASSOCIATION\_SUCCESSFUL** is absent, the ProgID or application was not bound into the IDList. |
     * | STR\_PARSE\_WITH\_EXPLICIT\_ASSOCAPP          | VT\_BSTR | **Introduced in Windows 7**. Specify this property to cause a call to the [**IShellFolder::ParseDisplayName**](/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-parsedisplayname) method to return an IDList bound to the file type association handler for the application.                                                                                                                                                                                                                                          |
     * | STR\_PARSE\_WITH\_EXPLICIT\_PROGID            | VT\_BSTR | **Introduced in Windows 7**. Specify this property to cause a call to the [**IShellFolder::ParseDisplayName**](/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-parsedisplayname) method to return an IDList bound to the file association handler of the provided [ProgID](fa-progids.md).                                                                                                                                                                                                                          |
     * 
     * 
     * 
     *  
     * 
     * See the [Parsing With Parameters Sample](samples-parsingwithparameters.md) for an example of the use of bind context values.
     * @param {HANDLE} hPort 
     * @param {HANDLE} hHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/str-constants
     */
    Bind(hPort, hHandle) {
        result := ComCall(11, this, HANDLE, hPort, HANDLE, hHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMinIOCompletionThreads 
     * @returns {HRESULT} 
     */
    SetMinThreads(dwMinIOCompletionThreads) {
        result := ComCall(12, this, "uint", dwMinIOCompletionThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMinThreads() {
        result := ComCall(13, this, "uint*", &pdwMinIOCompletionThreads := 0, "HRESULT")
        return pdwMinIOCompletionThreads
    }

    Query(iid) {
        if (IHostIoCompletionManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateIoCompletionPort := CallbackCreate(GetMethod(implObj, "CreateIoCompletionPort"), flags, 2)
        this.vtbl.CloseIoCompletionPort := CallbackCreate(GetMethod(implObj, "CloseIoCompletionPort"), flags, 2)
        this.vtbl.SetMaxThreads := CallbackCreate(GetMethod(implObj, "SetMaxThreads"), flags, 2)
        this.vtbl.GetMaxThreads := CallbackCreate(GetMethod(implObj, "GetMaxThreads"), flags, 2)
        this.vtbl.GetAvailableThreads := CallbackCreate(GetMethod(implObj, "GetAvailableThreads"), flags, 2)
        this.vtbl.GetHostOverlappedSize := CallbackCreate(GetMethod(implObj, "GetHostOverlappedSize"), flags, 2)
        this.vtbl.SetCLRIoCompletionManager := CallbackCreate(GetMethod(implObj, "SetCLRIoCompletionManager"), flags, 2)
        this.vtbl.InitializeHostOverlapped := CallbackCreate(GetMethod(implObj, "InitializeHostOverlapped"), flags, 2)
        this.vtbl.Bind := CallbackCreate(GetMethod(implObj, "Bind"), flags, 3)
        this.vtbl.SetMinThreads := CallbackCreate(GetMethod(implObj, "SetMinThreads"), flags, 2)
        this.vtbl.GetMinThreads := CallbackCreate(GetMethod(implObj, "GetMinThreads"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateIoCompletionPort)
        CallbackFree(this.vtbl.CloseIoCompletionPort)
        CallbackFree(this.vtbl.SetMaxThreads)
        CallbackFree(this.vtbl.GetMaxThreads)
        CallbackFree(this.vtbl.GetAvailableThreads)
        CallbackFree(this.vtbl.GetHostOverlappedSize)
        CallbackFree(this.vtbl.SetCLRIoCompletionManager)
        CallbackFree(this.vtbl.InitializeHostOverlapped)
        CallbackFree(this.vtbl.Bind)
        CallbackFree(this.vtbl.SetMinThreads)
        CallbackFree(this.vtbl.GetMinThreads)
    }
}
