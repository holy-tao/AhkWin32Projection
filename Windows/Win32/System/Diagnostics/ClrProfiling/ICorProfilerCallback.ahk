#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerCallback
     * @type {Guid}
     */
    static IID => Guid("{176fbed1-a55c-4796-98ca-a9da0ef883e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Shutdown", "AppDomainCreationStarted", "AppDomainCreationFinished", "AppDomainShutdownStarted", "AppDomainShutdownFinished", "AssemblyLoadStarted", "AssemblyLoadFinished", "AssemblyUnloadStarted", "AssemblyUnloadFinished", "ModuleLoadStarted", "ModuleLoadFinished", "ModuleUnloadStarted", "ModuleUnloadFinished", "ModuleAttachedToAssembly", "ClassLoadStarted", "ClassLoadFinished", "ClassUnloadStarted", "ClassUnloadFinished", "FunctionUnloadStarted", "JITCompilationStarted", "JITCompilationFinished", "JITCachedFunctionSearchStarted", "JITCachedFunctionSearchFinished", "JITFunctionPitched", "JITInlining", "ThreadCreated", "ThreadDestroyed", "ThreadAssignedToOSThread", "RemotingClientInvocationStarted", "RemotingClientSendingMessage", "RemotingClientReceivingReply", "RemotingClientInvocationFinished", "RemotingServerReceivingMessage", "RemotingServerInvocationStarted", "RemotingServerInvocationReturned", "RemotingServerSendingReply", "UnmanagedToManagedTransition", "ManagedToUnmanagedTransition", "RuntimeSuspendStarted", "RuntimeSuspendFinished", "RuntimeSuspendAborted", "RuntimeResumeStarted", "RuntimeResumeFinished", "RuntimeThreadSuspended", "RuntimeThreadResumed", "MovedReferences", "ObjectAllocated", "ObjectsAllocatedByClass", "ObjectReferences", "RootReferences", "ExceptionThrown", "ExceptionSearchFunctionEnter", "ExceptionSearchFunctionLeave", "ExceptionSearchFilterEnter", "ExceptionSearchFilterLeave", "ExceptionSearchCatcherFound", "ExceptionOSHandlerEnter", "ExceptionOSHandlerLeave", "ExceptionUnwindFunctionEnter", "ExceptionUnwindFunctionLeave", "ExceptionUnwindFinallyEnter", "ExceptionUnwindFinallyLeave", "ExceptionCatcherEnter", "ExceptionCatcherLeave", "COMClassicVTableCreated", "COMClassicVTableDestroyed", "ExceptionCLRCatcherFound", "ExceptionCLRCatcherExecute"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
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
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pICorProfilerInfoUnk) {
        result := ComCall(3, this, "ptr", pICorProfilerInfoUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Shutdown() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} appDomainId 
     * @returns {HRESULT} 
     */
    AppDomainCreationStarted(appDomainId) {
        result := ComCall(5, this, "ptr", appDomainId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} appDomainId 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    AppDomainCreationFinished(appDomainId, hrStatus) {
        result := ComCall(6, this, "ptr", appDomainId, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} appDomainId 
     * @returns {HRESULT} 
     */
    AppDomainShutdownStarted(appDomainId) {
        result := ComCall(7, this, "ptr", appDomainId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} appDomainId 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    AppDomainShutdownFinished(appDomainId, hrStatus) {
        result := ComCall(8, this, "ptr", appDomainId, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} assemblyId 
     * @returns {HRESULT} 
     */
    AssemblyLoadStarted(assemblyId) {
        result := ComCall(9, this, "ptr", assemblyId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} assemblyId 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    AssemblyLoadFinished(assemblyId, hrStatus) {
        result := ComCall(10, this, "ptr", assemblyId, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} assemblyId 
     * @returns {HRESULT} 
     */
    AssemblyUnloadStarted(assemblyId) {
        result := ComCall(11, this, "ptr", assemblyId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} assemblyId 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    AssemblyUnloadFinished(assemblyId, hrStatus) {
        result := ComCall(12, this, "ptr", assemblyId, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @returns {HRESULT} 
     */
    ModuleLoadStarted(moduleId) {
        result := ComCall(13, this, "ptr", moduleId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    ModuleLoadFinished(moduleId, hrStatus) {
        result := ComCall(14, this, "ptr", moduleId, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @returns {HRESULT} 
     */
    ModuleUnloadStarted(moduleId) {
        result := ComCall(15, this, "ptr", moduleId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    ModuleUnloadFinished(moduleId, hrStatus) {
        result := ComCall(16, this, "ptr", moduleId, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} moduleId 
     * @param {Pointer} AssemblyId 
     * @returns {HRESULT} 
     */
    ModuleAttachedToAssembly(moduleId, AssemblyId) {
        result := ComCall(17, this, "ptr", moduleId, "ptr", AssemblyId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @returns {HRESULT} 
     */
    ClassLoadStarted(classId) {
        result := ComCall(18, this, "ptr", classId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    ClassLoadFinished(classId, hrStatus) {
        result := ComCall(19, this, "ptr", classId, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @returns {HRESULT} 
     */
    ClassUnloadStarted(classId) {
        result := ComCall(20, this, "ptr", classId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} classId 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    ClassUnloadFinished(classId, hrStatus) {
        result := ComCall(21, this, "ptr", classId, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @returns {HRESULT} 
     */
    FunctionUnloadStarted(functionId) {
        result := ComCall(22, this, "ptr", functionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {BOOL} fIsSafeToBlock 
     * @returns {HRESULT} 
     */
    JITCompilationStarted(functionId, fIsSafeToBlock) {
        result := ComCall(23, this, "ptr", functionId, "int", fIsSafeToBlock, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {HRESULT} hrStatus 
     * @param {BOOL} fIsSafeToBlock 
     * @returns {HRESULT} 
     */
    JITCompilationFinished(functionId, hrStatus, fIsSafeToBlock) {
        result := ComCall(24, this, "ptr", functionId, "int", hrStatus, "int", fIsSafeToBlock, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer<BOOL>} pbUseCachedFunction 
     * @returns {HRESULT} 
     */
    JITCachedFunctionSearchStarted(functionId, pbUseCachedFunction) {
        result := ComCall(25, this, "ptr", functionId, "ptr", pbUseCachedFunction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Integer} result 
     * @returns {HRESULT} 
     */
    JITCachedFunctionSearchFinished(functionId, result) {
        result := ComCall(26, this, "ptr", functionId, "int", result, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @returns {HRESULT} 
     */
    JITFunctionPitched(functionId) {
        result := ComCall(27, this, "ptr", functionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} callerId 
     * @param {Pointer} calleeId 
     * @param {Pointer<BOOL>} pfShouldInline 
     * @returns {HRESULT} 
     */
    JITInlining(callerId, calleeId, pfShouldInline) {
        result := ComCall(28, this, "ptr", callerId, "ptr", calleeId, "ptr", pfShouldInline, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} threadId 
     * @returns {HRESULT} 
     */
    ThreadCreated(threadId) {
        result := ComCall(29, this, "ptr", threadId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} threadId 
     * @returns {HRESULT} 
     */
    ThreadDestroyed(threadId) {
        result := ComCall(30, this, "ptr", threadId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} managedThreadId 
     * @param {Integer} osThreadId 
     * @returns {HRESULT} 
     */
    ThreadAssignedToOSThread(managedThreadId, osThreadId) {
        result := ComCall(31, this, "ptr", managedThreadId, "uint", osThreadId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemotingClientInvocationStarted() {
        result := ComCall(32, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pCookie 
     * @param {BOOL} fIsAsync 
     * @returns {HRESULT} 
     */
    RemotingClientSendingMessage(pCookie, fIsAsync) {
        result := ComCall(33, this, "ptr", pCookie, "int", fIsAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pCookie 
     * @param {BOOL} fIsAsync 
     * @returns {HRESULT} 
     */
    RemotingClientReceivingReply(pCookie, fIsAsync) {
        result := ComCall(34, this, "ptr", pCookie, "int", fIsAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemotingClientInvocationFinished() {
        result := ComCall(35, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pCookie 
     * @param {BOOL} fIsAsync 
     * @returns {HRESULT} 
     */
    RemotingServerReceivingMessage(pCookie, fIsAsync) {
        result := ComCall(36, this, "ptr", pCookie, "int", fIsAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemotingServerInvocationStarted() {
        result := ComCall(37, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemotingServerInvocationReturned() {
        result := ComCall(38, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pCookie 
     * @param {BOOL} fIsAsync 
     * @returns {HRESULT} 
     */
    RemotingServerSendingReply(pCookie, fIsAsync) {
        result := ComCall(39, this, "ptr", pCookie, "int", fIsAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Integer} reason 
     * @returns {HRESULT} 
     */
    UnmanagedToManagedTransition(functionId, reason) {
        result := ComCall(40, this, "ptr", functionId, "int", reason, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Integer} reason 
     * @returns {HRESULT} 
     */
    ManagedToUnmanagedTransition(functionId, reason) {
        result := ComCall(41, this, "ptr", functionId, "int", reason, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} suspendReason 
     * @returns {HRESULT} 
     */
    RuntimeSuspendStarted(suspendReason) {
        result := ComCall(42, this, "int", suspendReason, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RuntimeSuspendFinished() {
        result := ComCall(43, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RuntimeSuspendAborted() {
        result := ComCall(44, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RuntimeResumeStarted() {
        result := ComCall(45, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RuntimeResumeFinished() {
        result := ComCall(46, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} threadId 
     * @returns {HRESULT} 
     */
    RuntimeThreadSuspended(threadId) {
        result := ComCall(47, this, "ptr", threadId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} threadId 
     * @returns {HRESULT} 
     */
    RuntimeThreadResumed(threadId) {
        result := ComCall(48, this, "ptr", threadId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cMovedObjectIDRanges 
     * @param {Pointer<Pointer>} oldObjectIDRangeStart 
     * @param {Pointer<Pointer>} newObjectIDRangeStart 
     * @param {Pointer<Integer>} cObjectIDRangeLength 
     * @returns {HRESULT} 
     */
    MovedReferences(cMovedObjectIDRanges, oldObjectIDRangeStart, newObjectIDRangeStart, cObjectIDRangeLength) {
        result := ComCall(49, this, "uint", cMovedObjectIDRanges, "ptr*", oldObjectIDRangeStart, "ptr*", newObjectIDRangeStart, "uint*", cObjectIDRangeLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} objectId 
     * @param {Pointer} classId 
     * @returns {HRESULT} 
     */
    ObjectAllocated(objectId, classId) {
        result := ComCall(50, this, "ptr", objectId, "ptr", classId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cClassCount 
     * @param {Pointer<Pointer>} classIds 
     * @param {Pointer<Integer>} cObjects 
     * @returns {HRESULT} 
     */
    ObjectsAllocatedByClass(cClassCount, classIds, cObjects) {
        result := ComCall(51, this, "uint", cClassCount, "ptr*", classIds, "uint*", cObjects, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} objectId 
     * @param {Pointer} classId 
     * @param {Integer} cObjectRefs 
     * @param {Pointer<Pointer>} objectRefIds 
     * @returns {HRESULT} 
     */
    ObjectReferences(objectId, classId, cObjectRefs, objectRefIds) {
        result := ComCall(52, this, "ptr", objectId, "ptr", classId, "uint", cObjectRefs, "ptr*", objectRefIds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cRootRefs 
     * @param {Pointer<Pointer>} rootRefIds 
     * @returns {HRESULT} 
     */
    RootReferences(cRootRefs, rootRefIds) {
        result := ComCall(53, this, "uint", cRootRefs, "ptr*", rootRefIds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} thrownObjectId 
     * @returns {HRESULT} 
     */
    ExceptionThrown(thrownObjectId) {
        result := ComCall(54, this, "ptr", thrownObjectId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @returns {HRESULT} 
     */
    ExceptionSearchFunctionEnter(functionId) {
        result := ComCall(55, this, "ptr", functionId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ExceptionSearchFunctionLeave() {
        result := ComCall(56, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @returns {HRESULT} 
     */
    ExceptionSearchFilterEnter(functionId) {
        result := ComCall(57, this, "ptr", functionId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ExceptionSearchFilterLeave() {
        result := ComCall(58, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @returns {HRESULT} 
     */
    ExceptionSearchCatcherFound(functionId) {
        result := ComCall(59, this, "ptr", functionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} __unused 
     * @returns {HRESULT} 
     */
    ExceptionOSHandlerEnter(__unused) {
        result := ComCall(60, this, "ptr", __unused, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} __unused 
     * @returns {HRESULT} 
     */
    ExceptionOSHandlerLeave(__unused) {
        result := ComCall(61, this, "ptr", __unused, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @returns {HRESULT} 
     */
    ExceptionUnwindFunctionEnter(functionId) {
        result := ComCall(62, this, "ptr", functionId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ExceptionUnwindFunctionLeave() {
        result := ComCall(63, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @returns {HRESULT} 
     */
    ExceptionUnwindFinallyEnter(functionId) {
        result := ComCall(64, this, "ptr", functionId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ExceptionUnwindFinallyLeave() {
        result := ComCall(65, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} functionId 
     * @param {Pointer} objectId 
     * @returns {HRESULT} 
     */
    ExceptionCatcherEnter(functionId, objectId) {
        result := ComCall(66, this, "ptr", functionId, "ptr", objectId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ExceptionCatcherLeave() {
        result := ComCall(67, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} wrappedClassId 
     * @param {Pointer<Guid>} implementedIID 
     * @param {Pointer<Void>} pVTable 
     * @param {Integer} cSlots 
     * @returns {HRESULT} 
     */
    COMClassicVTableCreated(wrappedClassId, implementedIID, pVTable, cSlots) {
        result := ComCall(68, this, "ptr", wrappedClassId, "ptr", implementedIID, "ptr", pVTable, "uint", cSlots, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} wrappedClassId 
     * @param {Pointer<Guid>} implementedIID 
     * @param {Pointer<Void>} pVTable 
     * @returns {HRESULT} 
     */
    COMClassicVTableDestroyed(wrappedClassId, implementedIID, pVTable) {
        result := ComCall(69, this, "ptr", wrappedClassId, "ptr", implementedIID, "ptr", pVTable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ExceptionCLRCatcherFound() {
        result := ComCall(70, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ExceptionCLRCatcherExecute() {
        result := ComCall(71, this, "HRESULT")
        return result
    }
}
