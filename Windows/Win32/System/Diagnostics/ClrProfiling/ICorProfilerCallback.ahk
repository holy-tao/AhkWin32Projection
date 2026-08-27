#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\COR_PRF_JIT_CACHE.ahk" { COR_PRF_JIT_CACHE }
#Import ".\COR_PRF_SUSPEND_REASON.ahk" { COR_PRF_SUSPEND_REASON }
#Import ".\COR_PRF_TRANSITION_REASON.ahk" { COR_PRF_TRANSITION_REASON }

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct ICorProfilerCallback extends IUnknown {
    /**
     * The interface identifier for ICorProfilerCallback
     * @type {Guid}
     */
    static IID := Guid("{176fbed1-a55c-4796-98ca-a9da0ef883e7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICorProfilerCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize                       : IntPtr
        Shutdown                         : IntPtr
        AppDomainCreationStarted         : IntPtr
        AppDomainCreationFinished        : IntPtr
        AppDomainShutdownStarted         : IntPtr
        AppDomainShutdownFinished        : IntPtr
        AssemblyLoadStarted              : IntPtr
        AssemblyLoadFinished             : IntPtr
        AssemblyUnloadStarted            : IntPtr
        AssemblyUnloadFinished           : IntPtr
        ModuleLoadStarted                : IntPtr
        ModuleLoadFinished               : IntPtr
        ModuleUnloadStarted              : IntPtr
        ModuleUnloadFinished             : IntPtr
        ModuleAttachedToAssembly         : IntPtr
        ClassLoadStarted                 : IntPtr
        ClassLoadFinished                : IntPtr
        ClassUnloadStarted               : IntPtr
        ClassUnloadFinished              : IntPtr
        FunctionUnloadStarted            : IntPtr
        JITCompilationStarted            : IntPtr
        JITCompilationFinished           : IntPtr
        JITCachedFunctionSearchStarted   : IntPtr
        JITCachedFunctionSearchFinished  : IntPtr
        JITFunctionPitched               : IntPtr
        JITInlining                      : IntPtr
        ThreadCreated                    : IntPtr
        ThreadDestroyed                  : IntPtr
        ThreadAssignedToOSThread         : IntPtr
        RemotingClientInvocationStarted  : IntPtr
        RemotingClientSendingMessage     : IntPtr
        RemotingClientReceivingReply     : IntPtr
        RemotingClientInvocationFinished : IntPtr
        RemotingServerReceivingMessage   : IntPtr
        RemotingServerInvocationStarted  : IntPtr
        RemotingServerInvocationReturned : IntPtr
        RemotingServerSendingReply       : IntPtr
        UnmanagedToManagedTransition     : IntPtr
        ManagedToUnmanagedTransition     : IntPtr
        RuntimeSuspendStarted            : IntPtr
        RuntimeSuspendFinished           : IntPtr
        RuntimeSuspendAborted            : IntPtr
        RuntimeResumeStarted             : IntPtr
        RuntimeResumeFinished            : IntPtr
        RuntimeThreadSuspended           : IntPtr
        RuntimeThreadResumed             : IntPtr
        MovedReferences                  : IntPtr
        ObjectAllocated                  : IntPtr
        ObjectsAllocatedByClass          : IntPtr
        ObjectReferences                 : IntPtr
        RootReferences                   : IntPtr
        ExceptionThrown                  : IntPtr
        ExceptionSearchFunctionEnter     : IntPtr
        ExceptionSearchFunctionLeave     : IntPtr
        ExceptionSearchFilterEnter       : IntPtr
        ExceptionSearchFilterLeave       : IntPtr
        ExceptionSearchCatcherFound      : IntPtr
        ExceptionOSHandlerEnter          : IntPtr
        ExceptionOSHandlerLeave          : IntPtr
        ExceptionUnwindFunctionEnter     : IntPtr
        ExceptionUnwindFunctionLeave     : IntPtr
        ExceptionUnwindFinallyEnter      : IntPtr
        ExceptionUnwindFinallyLeave      : IntPtr
        ExceptionCatcherEnter            : IntPtr
        ExceptionCatcherLeave            : IntPtr
        COMClassicVTableCreated          : IntPtr
        COMClassicVTableDestroyed        : IntPtr
        ExceptionCLRCatcherFound         : IntPtr
        ExceptionCLRCatcherExecute       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICorProfilerCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @remarks
     * <b>Windows::Foundation::Initialize</b> is changed to create 
     *     ASTAs instead of classic STAs for the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/ne-roapi-ro_init_type">RO_INIT_TYPE</a> 
     *     value <b>RO_INIT_SINGLETHREADED</b>. 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_SINGLETHREADED</b>) 
     *     is not supported for desktop applications and will return <b>CO_E_NOTSUPPORTED</b> if called 
     *     from a process other than a Windows Store app.
     * 
     * For Microsoft DirectX applications, you must initialize the initial thread by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * 
     * For an out-of-process EXE server,  you must initialize the initial thread of the server by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * @param {IUnknown} pICorProfilerInfoUnk 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-initialize
     */
    Initialize(pICorProfilerInfoUnk) {
        result := ComCall(3, this, "ptr", pICorProfilerInfoUnk, "HRESULT")
        return result
    }

    /**
     * Stops the collector. If the collector is running as a service, stopping the service is the better approach.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/BEvtColProv/control-shutdown
     */
    Shutdown() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} appDomainId 
     * @returns {HRESULT} 
     */
    AppDomainCreationStarted(appDomainId) {
        result := ComCall(5, this, IntPtr, appDomainId, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} appDomainId 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    AppDomainCreationFinished(appDomainId, hrStatus) {
        result := ComCall(6, this, IntPtr, appDomainId, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} appDomainId 
     * @returns {HRESULT} 
     */
    AppDomainShutdownStarted(appDomainId) {
        result := ComCall(7, this, IntPtr, appDomainId, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} appDomainId 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    AppDomainShutdownFinished(appDomainId, hrStatus) {
        result := ComCall(8, this, IntPtr, appDomainId, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} assemblyId 
     * @returns {HRESULT} 
     */
    AssemblyLoadStarted(assemblyId) {
        result := ComCall(9, this, IntPtr, assemblyId, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} assemblyId 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    AssemblyLoadFinished(assemblyId, hrStatus) {
        result := ComCall(10, this, IntPtr, assemblyId, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} assemblyId 
     * @returns {HRESULT} 
     */
    AssemblyUnloadStarted(assemblyId) {
        result := ComCall(11, this, IntPtr, assemblyId, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} assemblyId 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    AssemblyUnloadFinished(assemblyId, hrStatus) {
        result := ComCall(12, this, IntPtr, assemblyId, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} moduleId 
     * @returns {HRESULT} 
     */
    ModuleLoadStarted(moduleId) {
        result := ComCall(13, this, IntPtr, moduleId, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} moduleId 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    ModuleLoadFinished(moduleId, hrStatus) {
        result := ComCall(14, this, IntPtr, moduleId, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} moduleId 
     * @returns {HRESULT} 
     */
    ModuleUnloadStarted(moduleId) {
        result := ComCall(15, this, IntPtr, moduleId, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} moduleId 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    ModuleUnloadFinished(moduleId, hrStatus) {
        result := ComCall(16, this, IntPtr, moduleId, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} moduleId 
     * @param {Pointer} AssemblyId 
     * @returns {HRESULT} 
     */
    ModuleAttachedToAssembly(moduleId, AssemblyId) {
        result := ComCall(17, this, IntPtr, moduleId, IntPtr, AssemblyId, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} classId 
     * @returns {HRESULT} 
     */
    ClassLoadStarted(classId) {
        result := ComCall(18, this, IntPtr, classId, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} classId 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    ClassLoadFinished(classId, hrStatus) {
        result := ComCall(19, this, IntPtr, classId, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} classId 
     * @returns {HRESULT} 
     */
    ClassUnloadStarted(classId) {
        result := ComCall(20, this, IntPtr, classId, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} classId 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    ClassUnloadFinished(classId, hrStatus) {
        result := ComCall(21, this, IntPtr, classId, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} functionId 
     * @returns {HRESULT} 
     */
    FunctionUnloadStarted(functionId) {
        result := ComCall(22, this, IntPtr, functionId, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} functionId 
     * @param {BOOL} fIsSafeToBlock 
     * @returns {HRESULT} 
     */
    JITCompilationStarted(functionId, fIsSafeToBlock) {
        result := ComCall(23, this, IntPtr, functionId, BOOL, fIsSafeToBlock, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} functionId 
     * @param {HRESULT} hrStatus 
     * @param {BOOL} fIsSafeToBlock 
     * @returns {HRESULT} 
     */
    JITCompilationFinished(functionId, hrStatus, fIsSafeToBlock) {
        result := ComCall(24, this, IntPtr, functionId, "int", hrStatus, BOOL, fIsSafeToBlock, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} functionId 
     * @returns {BOOL} 
     */
    JITCachedFunctionSearchStarted(functionId) {
        result := ComCall(25, this, IntPtr, functionId, BOOL.Ptr, &pbUseCachedFunction := 0, "HRESULT")
        return pbUseCachedFunction
    }

    /**
     * @param {Pointer} functionId 
     * @param {COR_PRF_JIT_CACHE} result 
     * @returns {HRESULT} 
     */
    JITCachedFunctionSearchFinished(functionId, result) {
        result := ComCall(26, this, IntPtr, functionId, COR_PRF_JIT_CACHE, result, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} functionId 
     * @returns {HRESULT} 
     */
    JITFunctionPitched(functionId) {
        result := ComCall(27, this, IntPtr, functionId, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} callerId 
     * @param {Pointer} calleeId 
     * @returns {BOOL} 
     */
    JITInlining(callerId, calleeId) {
        result := ComCall(28, this, IntPtr, callerId, IntPtr, calleeId, BOOL.Ptr, &pfShouldInline := 0, "HRESULT")
        return pfShouldInline
    }

    /**
     * @param {Pointer} threadId 
     * @returns {HRESULT} 
     */
    ThreadCreated(threadId) {
        result := ComCall(29, this, IntPtr, threadId, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} threadId 
     * @returns {HRESULT} 
     */
    ThreadDestroyed(threadId) {
        result := ComCall(30, this, IntPtr, threadId, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} managedThreadId 
     * @param {Integer} osThreadId 
     * @returns {HRESULT} 
     */
    ThreadAssignedToOSThread(managedThreadId, osThreadId) {
        result := ComCall(31, this, IntPtr, managedThreadId, UInt32, osThreadId, "HRESULT")
        return result
    }

    /**
     * @returns {HRESULT} 
     */
    RemotingClientInvocationStarted() {
        result := ComCall(32, this, "HRESULT")
        return result
    }

    /**
     * @param {Pointer<Guid>} pCookie 
     * @param {BOOL} fIsAsync 
     * @returns {HRESULT} 
     */
    RemotingClientSendingMessage(pCookie, fIsAsync) {
        result := ComCall(33, this, Guid.Ptr, pCookie, BOOL, fIsAsync, "HRESULT")
        return result
    }

    /**
     * @param {Pointer<Guid>} pCookie 
     * @param {BOOL} fIsAsync 
     * @returns {HRESULT} 
     */
    RemotingClientReceivingReply(pCookie, fIsAsync) {
        result := ComCall(34, this, Guid.Ptr, pCookie, BOOL, fIsAsync, "HRESULT")
        return result
    }

    /**
     * @returns {HRESULT} 
     */
    RemotingClientInvocationFinished() {
        result := ComCall(35, this, "HRESULT")
        return result
    }

    /**
     * @param {Pointer<Guid>} pCookie 
     * @param {BOOL} fIsAsync 
     * @returns {HRESULT} 
     */
    RemotingServerReceivingMessage(pCookie, fIsAsync) {
        result := ComCall(36, this, Guid.Ptr, pCookie, BOOL, fIsAsync, "HRESULT")
        return result
    }

    /**
     * @returns {HRESULT} 
     */
    RemotingServerInvocationStarted() {
        result := ComCall(37, this, "HRESULT")
        return result
    }

    /**
     * @returns {HRESULT} 
     */
    RemotingServerInvocationReturned() {
        result := ComCall(38, this, "HRESULT")
        return result
    }

    /**
     * @param {Pointer<Guid>} pCookie 
     * @param {BOOL} fIsAsync 
     * @returns {HRESULT} 
     */
    RemotingServerSendingReply(pCookie, fIsAsync) {
        result := ComCall(39, this, Guid.Ptr, pCookie, BOOL, fIsAsync, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} functionId 
     * @param {COR_PRF_TRANSITION_REASON} reason 
     * @returns {HRESULT} 
     */
    UnmanagedToManagedTransition(functionId, reason) {
        result := ComCall(40, this, IntPtr, functionId, COR_PRF_TRANSITION_REASON, reason, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} functionId 
     * @param {COR_PRF_TRANSITION_REASON} reason 
     * @returns {HRESULT} 
     */
    ManagedToUnmanagedTransition(functionId, reason) {
        result := ComCall(41, this, IntPtr, functionId, COR_PRF_TRANSITION_REASON, reason, "HRESULT")
        return result
    }

    /**
     * @param {COR_PRF_SUSPEND_REASON} suspendReason 
     * @returns {HRESULT} 
     */
    RuntimeSuspendStarted(suspendReason) {
        result := ComCall(42, this, COR_PRF_SUSPEND_REASON, suspendReason, "HRESULT")
        return result
    }

    /**
     * @returns {HRESULT} 
     */
    RuntimeSuspendFinished() {
        result := ComCall(43, this, "HRESULT")
        return result
    }

    /**
     * @returns {HRESULT} 
     */
    RuntimeSuspendAborted() {
        result := ComCall(44, this, "HRESULT")
        return result
    }

    /**
     * @returns {HRESULT} 
     */
    RuntimeResumeStarted() {
        result := ComCall(45, this, "HRESULT")
        return result
    }

    /**
     * @returns {HRESULT} 
     */
    RuntimeResumeFinished() {
        result := ComCall(46, this, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} threadId 
     * @returns {HRESULT} 
     */
    RuntimeThreadSuspended(threadId) {
        result := ComCall(47, this, IntPtr, threadId, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} threadId 
     * @returns {HRESULT} 
     */
    RuntimeThreadResumed(threadId) {
        result := ComCall(48, this, IntPtr, threadId, "HRESULT")
        return result
    }

    /**
     * @param {Integer} cMovedObjectIDRanges 
     * @param {Pointer<Pointer>} oldObjectIDRangeStart 
     * @param {Pointer<Pointer>} newObjectIDRangeStart 
     * @param {Pointer<Integer>} cObjectIDRangeLength 
     * @returns {HRESULT} 
     */
    MovedReferences(cMovedObjectIDRanges, oldObjectIDRangeStart, newObjectIDRangeStart, cObjectIDRangeLength) {
        oldObjectIDRangeStartMarshal := oldObjectIDRangeStart is VarRef ? "ptr*" : IntPtr
        newObjectIDRangeStartMarshal := newObjectIDRangeStart is VarRef ? "ptr*" : IntPtr
        cObjectIDRangeLengthMarshal := cObjectIDRangeLength is VarRef ? "uint*" : IntPtr

        result := ComCall(49, this, UInt32, cMovedObjectIDRanges, oldObjectIDRangeStartMarshal, oldObjectIDRangeStart, newObjectIDRangeStartMarshal, newObjectIDRangeStart, cObjectIDRangeLengthMarshal, cObjectIDRangeLength, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} _objectId 
     * @param {Pointer} classId 
     * @returns {HRESULT} 
     */
    ObjectAllocated(_objectId, classId) {
        result := ComCall(50, this, IntPtr, _objectId, IntPtr, classId, "HRESULT")
        return result
    }

    /**
     * @param {Integer} cClassCount 
     * @param {Pointer<Pointer>} classIds 
     * @param {Pointer<Integer>} cObjects 
     * @returns {HRESULT} 
     */
    ObjectsAllocatedByClass(cClassCount, classIds, cObjects) {
        classIdsMarshal := classIds is VarRef ? "ptr*" : IntPtr
        cObjectsMarshal := cObjects is VarRef ? "uint*" : IntPtr

        result := ComCall(51, this, UInt32, cClassCount, classIdsMarshal, classIds, cObjectsMarshal, cObjects, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} _objectId 
     * @param {Pointer} classId 
     * @param {Integer} cObjectRefs 
     * @param {Pointer<Pointer>} objectRefIds 
     * @returns {HRESULT} 
     */
    ObjectReferences(_objectId, classId, cObjectRefs, objectRefIds) {
        objectRefIdsMarshal := objectRefIds is VarRef ? "ptr*" : IntPtr

        result := ComCall(52, this, IntPtr, _objectId, IntPtr, classId, UInt32, cObjectRefs, objectRefIdsMarshal, objectRefIds, "HRESULT")
        return result
    }

    /**
     * @param {Integer} cRootRefs 
     * @param {Pointer<Pointer>} rootRefIds 
     * @returns {HRESULT} 
     */
    RootReferences(cRootRefs, rootRefIds) {
        rootRefIdsMarshal := rootRefIds is VarRef ? "ptr*" : IntPtr

        result := ComCall(53, this, UInt32, cRootRefs, rootRefIdsMarshal, rootRefIds, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} thrownObjectId 
     * @returns {HRESULT} 
     */
    ExceptionThrown(thrownObjectId) {
        result := ComCall(54, this, IntPtr, thrownObjectId, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} functionId 
     * @returns {HRESULT} 
     */
    ExceptionSearchFunctionEnter(functionId) {
        result := ComCall(55, this, IntPtr, functionId, "HRESULT")
        return result
    }

    /**
     * @returns {HRESULT} 
     */
    ExceptionSearchFunctionLeave() {
        result := ComCall(56, this, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} functionId 
     * @returns {HRESULT} 
     */
    ExceptionSearchFilterEnter(functionId) {
        result := ComCall(57, this, IntPtr, functionId, "HRESULT")
        return result
    }

    /**
     * @returns {HRESULT} 
     */
    ExceptionSearchFilterLeave() {
        result := ComCall(58, this, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} functionId 
     * @returns {HRESULT} 
     */
    ExceptionSearchCatcherFound(functionId) {
        result := ComCall(59, this, IntPtr, functionId, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} __unused 
     * @returns {HRESULT} 
     */
    ExceptionOSHandlerEnter(__unused) {
        result := ComCall(60, this, IntPtr, __unused, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} __unused 
     * @returns {HRESULT} 
     */
    ExceptionOSHandlerLeave(__unused) {
        result := ComCall(61, this, IntPtr, __unused, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} functionId 
     * @returns {HRESULT} 
     */
    ExceptionUnwindFunctionEnter(functionId) {
        result := ComCall(62, this, IntPtr, functionId, "HRESULT")
        return result
    }

    /**
     * @returns {HRESULT} 
     */
    ExceptionUnwindFunctionLeave() {
        result := ComCall(63, this, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} functionId 
     * @returns {HRESULT} 
     */
    ExceptionUnwindFinallyEnter(functionId) {
        result := ComCall(64, this, IntPtr, functionId, "HRESULT")
        return result
    }

    /**
     * @returns {HRESULT} 
     */
    ExceptionUnwindFinallyLeave() {
        result := ComCall(65, this, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} functionId 
     * @param {Pointer} _objectId 
     * @returns {HRESULT} 
     */
    ExceptionCatcherEnter(functionId, _objectId) {
        result := ComCall(66, this, IntPtr, functionId, IntPtr, _objectId, "HRESULT")
        return result
    }

    /**
     * @returns {HRESULT} 
     */
    ExceptionCatcherLeave() {
        result := ComCall(67, this, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} wrappedClassId 
     * @param {Pointer<Guid>} implementedIID 
     * @param {Pointer<Void>} pVTable 
     * @param {Integer} cSlots 
     * @returns {HRESULT} 
     */
    COMClassicVTableCreated(wrappedClassId, implementedIID, pVTable, cSlots) {
        pVTableMarshal := pVTable is VarRef ? "ptr" : IntPtr

        result := ComCall(68, this, IntPtr, wrappedClassId, Guid.Ptr, implementedIID, pVTableMarshal, pVTable, UInt32, cSlots, "HRESULT")
        return result
    }

    /**
     * @param {Pointer} wrappedClassId 
     * @param {Pointer<Guid>} implementedIID 
     * @param {Pointer<Void>} pVTable 
     * @returns {HRESULT} 
     */
    COMClassicVTableDestroyed(wrappedClassId, implementedIID, pVTable) {
        pVTableMarshal := pVTable is VarRef ? "ptr" : IntPtr

        result := ComCall(69, this, IntPtr, wrappedClassId, Guid.Ptr, implementedIID, pVTableMarshal, pVTable, "HRESULT")
        return result
    }

    /**
     * @returns {HRESULT} 
     */
    ExceptionCLRCatcherFound() {
        result := ComCall(70, this, "HRESULT")
        return result
    }

    /**
     * @returns {HRESULT} 
     */
    ExceptionCLRCatcherExecute() {
        result := ComCall(71, this, "HRESULT")
        return result
    }

    _Query(iid) {
        if (ICorProfilerCallback.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(ObjBindMethod(implObj, "Initialize"), flags, 2)
        this.vtbl.Shutdown := CallbackCreate(ObjBindMethod(implObj, "Shutdown"), flags, 1)
        this.vtbl.AppDomainCreationStarted := CallbackCreate(ObjBindMethod(implObj, "AppDomainCreationStarted"), flags, 2)
        this.vtbl.AppDomainCreationFinished := CallbackCreate(ObjBindMethod(implObj, "AppDomainCreationFinished"), flags, 3)
        this.vtbl.AppDomainShutdownStarted := CallbackCreate(ObjBindMethod(implObj, "AppDomainShutdownStarted"), flags, 2)
        this.vtbl.AppDomainShutdownFinished := CallbackCreate(ObjBindMethod(implObj, "AppDomainShutdownFinished"), flags, 3)
        this.vtbl.AssemblyLoadStarted := CallbackCreate(ObjBindMethod(implObj, "AssemblyLoadStarted"), flags, 2)
        this.vtbl.AssemblyLoadFinished := CallbackCreate(ObjBindMethod(implObj, "AssemblyLoadFinished"), flags, 3)
        this.vtbl.AssemblyUnloadStarted := CallbackCreate(ObjBindMethod(implObj, "AssemblyUnloadStarted"), flags, 2)
        this.vtbl.AssemblyUnloadFinished := CallbackCreate(ObjBindMethod(implObj, "AssemblyUnloadFinished"), flags, 3)
        this.vtbl.ModuleLoadStarted := CallbackCreate(ObjBindMethod(implObj, "ModuleLoadStarted"), flags, 2)
        this.vtbl.ModuleLoadFinished := CallbackCreate(ObjBindMethod(implObj, "ModuleLoadFinished"), flags, 3)
        this.vtbl.ModuleUnloadStarted := CallbackCreate(ObjBindMethod(implObj, "ModuleUnloadStarted"), flags, 2)
        this.vtbl.ModuleUnloadFinished := CallbackCreate(ObjBindMethod(implObj, "ModuleUnloadFinished"), flags, 3)
        this.vtbl.ModuleAttachedToAssembly := CallbackCreate(ObjBindMethod(implObj, "ModuleAttachedToAssembly"), flags, 3)
        this.vtbl.ClassLoadStarted := CallbackCreate(ObjBindMethod(implObj, "ClassLoadStarted"), flags, 2)
        this.vtbl.ClassLoadFinished := CallbackCreate(ObjBindMethod(implObj, "ClassLoadFinished"), flags, 3)
        this.vtbl.ClassUnloadStarted := CallbackCreate(ObjBindMethod(implObj, "ClassUnloadStarted"), flags, 2)
        this.vtbl.ClassUnloadFinished := CallbackCreate(ObjBindMethod(implObj, "ClassUnloadFinished"), flags, 3)
        this.vtbl.FunctionUnloadStarted := CallbackCreate(ObjBindMethod(implObj, "FunctionUnloadStarted"), flags, 2)
        this.vtbl.JITCompilationStarted := CallbackCreate(ObjBindMethod(implObj, "JITCompilationStarted"), flags, 3)
        this.vtbl.JITCompilationFinished := CallbackCreate(ObjBindMethod(implObj, "JITCompilationFinished"), flags, 4)
        this.vtbl.JITCachedFunctionSearchStarted := CallbackCreate(ObjBindMethod(implObj, "JITCachedFunctionSearchStarted"), flags, 3)
        this.vtbl.JITCachedFunctionSearchFinished := CallbackCreate(ObjBindMethod(implObj, "JITCachedFunctionSearchFinished"), flags, 3)
        this.vtbl.JITFunctionPitched := CallbackCreate(ObjBindMethod(implObj, "JITFunctionPitched"), flags, 2)
        this.vtbl.JITInlining := CallbackCreate(ObjBindMethod(implObj, "JITInlining"), flags, 4)
        this.vtbl.ThreadCreated := CallbackCreate(ObjBindMethod(implObj, "ThreadCreated"), flags, 2)
        this.vtbl.ThreadDestroyed := CallbackCreate(ObjBindMethod(implObj, "ThreadDestroyed"), flags, 2)
        this.vtbl.ThreadAssignedToOSThread := CallbackCreate(ObjBindMethod(implObj, "ThreadAssignedToOSThread"), flags, 3)
        this.vtbl.RemotingClientInvocationStarted := CallbackCreate(ObjBindMethod(implObj, "RemotingClientInvocationStarted"), flags, 1)
        this.vtbl.RemotingClientSendingMessage := CallbackCreate(ObjBindMethod(implObj, "RemotingClientSendingMessage"), flags, 3)
        this.vtbl.RemotingClientReceivingReply := CallbackCreate(ObjBindMethod(implObj, "RemotingClientReceivingReply"), flags, 3)
        this.vtbl.RemotingClientInvocationFinished := CallbackCreate(ObjBindMethod(implObj, "RemotingClientInvocationFinished"), flags, 1)
        this.vtbl.RemotingServerReceivingMessage := CallbackCreate(ObjBindMethod(implObj, "RemotingServerReceivingMessage"), flags, 3)
        this.vtbl.RemotingServerInvocationStarted := CallbackCreate(ObjBindMethod(implObj, "RemotingServerInvocationStarted"), flags, 1)
        this.vtbl.RemotingServerInvocationReturned := CallbackCreate(ObjBindMethod(implObj, "RemotingServerInvocationReturned"), flags, 1)
        this.vtbl.RemotingServerSendingReply := CallbackCreate(ObjBindMethod(implObj, "RemotingServerSendingReply"), flags, 3)
        this.vtbl.UnmanagedToManagedTransition := CallbackCreate(ObjBindMethod(implObj, "UnmanagedToManagedTransition"), flags, 3)
        this.vtbl.ManagedToUnmanagedTransition := CallbackCreate(ObjBindMethod(implObj, "ManagedToUnmanagedTransition"), flags, 3)
        this.vtbl.RuntimeSuspendStarted := CallbackCreate(ObjBindMethod(implObj, "RuntimeSuspendStarted"), flags, 2)
        this.vtbl.RuntimeSuspendFinished := CallbackCreate(ObjBindMethod(implObj, "RuntimeSuspendFinished"), flags, 1)
        this.vtbl.RuntimeSuspendAborted := CallbackCreate(ObjBindMethod(implObj, "RuntimeSuspendAborted"), flags, 1)
        this.vtbl.RuntimeResumeStarted := CallbackCreate(ObjBindMethod(implObj, "RuntimeResumeStarted"), flags, 1)
        this.vtbl.RuntimeResumeFinished := CallbackCreate(ObjBindMethod(implObj, "RuntimeResumeFinished"), flags, 1)
        this.vtbl.RuntimeThreadSuspended := CallbackCreate(ObjBindMethod(implObj, "RuntimeThreadSuspended"), flags, 2)
        this.vtbl.RuntimeThreadResumed := CallbackCreate(ObjBindMethod(implObj, "RuntimeThreadResumed"), flags, 2)
        this.vtbl.MovedReferences := CallbackCreate(ObjBindMethod(implObj, "MovedReferences"), flags, 5)
        this.vtbl.ObjectAllocated := CallbackCreate(ObjBindMethod(implObj, "ObjectAllocated"), flags, 3)
        this.vtbl.ObjectsAllocatedByClass := CallbackCreate(ObjBindMethod(implObj, "ObjectsAllocatedByClass"), flags, 4)
        this.vtbl.ObjectReferences := CallbackCreate(ObjBindMethod(implObj, "ObjectReferences"), flags, 5)
        this.vtbl.RootReferences := CallbackCreate(ObjBindMethod(implObj, "RootReferences"), flags, 3)
        this.vtbl.ExceptionThrown := CallbackCreate(ObjBindMethod(implObj, "ExceptionThrown"), flags, 2)
        this.vtbl.ExceptionSearchFunctionEnter := CallbackCreate(ObjBindMethod(implObj, "ExceptionSearchFunctionEnter"), flags, 2)
        this.vtbl.ExceptionSearchFunctionLeave := CallbackCreate(ObjBindMethod(implObj, "ExceptionSearchFunctionLeave"), flags, 1)
        this.vtbl.ExceptionSearchFilterEnter := CallbackCreate(ObjBindMethod(implObj, "ExceptionSearchFilterEnter"), flags, 2)
        this.vtbl.ExceptionSearchFilterLeave := CallbackCreate(ObjBindMethod(implObj, "ExceptionSearchFilterLeave"), flags, 1)
        this.vtbl.ExceptionSearchCatcherFound := CallbackCreate(ObjBindMethod(implObj, "ExceptionSearchCatcherFound"), flags, 2)
        this.vtbl.ExceptionOSHandlerEnter := CallbackCreate(ObjBindMethod(implObj, "ExceptionOSHandlerEnter"), flags, 2)
        this.vtbl.ExceptionOSHandlerLeave := CallbackCreate(ObjBindMethod(implObj, "ExceptionOSHandlerLeave"), flags, 2)
        this.vtbl.ExceptionUnwindFunctionEnter := CallbackCreate(ObjBindMethod(implObj, "ExceptionUnwindFunctionEnter"), flags, 2)
        this.vtbl.ExceptionUnwindFunctionLeave := CallbackCreate(ObjBindMethod(implObj, "ExceptionUnwindFunctionLeave"), flags, 1)
        this.vtbl.ExceptionUnwindFinallyEnter := CallbackCreate(ObjBindMethod(implObj, "ExceptionUnwindFinallyEnter"), flags, 2)
        this.vtbl.ExceptionUnwindFinallyLeave := CallbackCreate(ObjBindMethod(implObj, "ExceptionUnwindFinallyLeave"), flags, 1)
        this.vtbl.ExceptionCatcherEnter := CallbackCreate(ObjBindMethod(implObj, "ExceptionCatcherEnter"), flags, 3)
        this.vtbl.ExceptionCatcherLeave := CallbackCreate(ObjBindMethod(implObj, "ExceptionCatcherLeave"), flags, 1)
        this.vtbl.COMClassicVTableCreated := CallbackCreate(ObjBindMethod(implObj, "COMClassicVTableCreated"), flags, 5)
        this.vtbl.COMClassicVTableDestroyed := CallbackCreate(ObjBindMethod(implObj, "COMClassicVTableDestroyed"), flags, 4)
        this.vtbl.ExceptionCLRCatcherFound := CallbackCreate(ObjBindMethod(implObj, "ExceptionCLRCatcherFound"), flags, 1)
        this.vtbl.ExceptionCLRCatcherExecute := CallbackCreate(ObjBindMethod(implObj, "ExceptionCLRCatcherExecute"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.Shutdown)
        CallbackFree(this.vtbl.AppDomainCreationStarted)
        CallbackFree(this.vtbl.AppDomainCreationFinished)
        CallbackFree(this.vtbl.AppDomainShutdownStarted)
        CallbackFree(this.vtbl.AppDomainShutdownFinished)
        CallbackFree(this.vtbl.AssemblyLoadStarted)
        CallbackFree(this.vtbl.AssemblyLoadFinished)
        CallbackFree(this.vtbl.AssemblyUnloadStarted)
        CallbackFree(this.vtbl.AssemblyUnloadFinished)
        CallbackFree(this.vtbl.ModuleLoadStarted)
        CallbackFree(this.vtbl.ModuleLoadFinished)
        CallbackFree(this.vtbl.ModuleUnloadStarted)
        CallbackFree(this.vtbl.ModuleUnloadFinished)
        CallbackFree(this.vtbl.ModuleAttachedToAssembly)
        CallbackFree(this.vtbl.ClassLoadStarted)
        CallbackFree(this.vtbl.ClassLoadFinished)
        CallbackFree(this.vtbl.ClassUnloadStarted)
        CallbackFree(this.vtbl.ClassUnloadFinished)
        CallbackFree(this.vtbl.FunctionUnloadStarted)
        CallbackFree(this.vtbl.JITCompilationStarted)
        CallbackFree(this.vtbl.JITCompilationFinished)
        CallbackFree(this.vtbl.JITCachedFunctionSearchStarted)
        CallbackFree(this.vtbl.JITCachedFunctionSearchFinished)
        CallbackFree(this.vtbl.JITFunctionPitched)
        CallbackFree(this.vtbl.JITInlining)
        CallbackFree(this.vtbl.ThreadCreated)
        CallbackFree(this.vtbl.ThreadDestroyed)
        CallbackFree(this.vtbl.ThreadAssignedToOSThread)
        CallbackFree(this.vtbl.RemotingClientInvocationStarted)
        CallbackFree(this.vtbl.RemotingClientSendingMessage)
        CallbackFree(this.vtbl.RemotingClientReceivingReply)
        CallbackFree(this.vtbl.RemotingClientInvocationFinished)
        CallbackFree(this.vtbl.RemotingServerReceivingMessage)
        CallbackFree(this.vtbl.RemotingServerInvocationStarted)
        CallbackFree(this.vtbl.RemotingServerInvocationReturned)
        CallbackFree(this.vtbl.RemotingServerSendingReply)
        CallbackFree(this.vtbl.UnmanagedToManagedTransition)
        CallbackFree(this.vtbl.ManagedToUnmanagedTransition)
        CallbackFree(this.vtbl.RuntimeSuspendStarted)
        CallbackFree(this.vtbl.RuntimeSuspendFinished)
        CallbackFree(this.vtbl.RuntimeSuspendAborted)
        CallbackFree(this.vtbl.RuntimeResumeStarted)
        CallbackFree(this.vtbl.RuntimeResumeFinished)
        CallbackFree(this.vtbl.RuntimeThreadSuspended)
        CallbackFree(this.vtbl.RuntimeThreadResumed)
        CallbackFree(this.vtbl.MovedReferences)
        CallbackFree(this.vtbl.ObjectAllocated)
        CallbackFree(this.vtbl.ObjectsAllocatedByClass)
        CallbackFree(this.vtbl.ObjectReferences)
        CallbackFree(this.vtbl.RootReferences)
        CallbackFree(this.vtbl.ExceptionThrown)
        CallbackFree(this.vtbl.ExceptionSearchFunctionEnter)
        CallbackFree(this.vtbl.ExceptionSearchFunctionLeave)
        CallbackFree(this.vtbl.ExceptionSearchFilterEnter)
        CallbackFree(this.vtbl.ExceptionSearchFilterLeave)
        CallbackFree(this.vtbl.ExceptionSearchCatcherFound)
        CallbackFree(this.vtbl.ExceptionOSHandlerEnter)
        CallbackFree(this.vtbl.ExceptionOSHandlerLeave)
        CallbackFree(this.vtbl.ExceptionUnwindFunctionEnter)
        CallbackFree(this.vtbl.ExceptionUnwindFunctionLeave)
        CallbackFree(this.vtbl.ExceptionUnwindFinallyEnter)
        CallbackFree(this.vtbl.ExceptionUnwindFinallyLeave)
        CallbackFree(this.vtbl.ExceptionCatcherEnter)
        CallbackFree(this.vtbl.ExceptionCatcherLeave)
        CallbackFree(this.vtbl.COMClassicVTableCreated)
        CallbackFree(this.vtbl.COMClassicVTableDestroyed)
        CallbackFree(this.vtbl.ExceptionCLRCatcherFound)
        CallbackFree(this.vtbl.ExceptionCLRCatcherExecute)
    }
}
