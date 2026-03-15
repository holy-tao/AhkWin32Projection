#Requires AutoHotkey v2.0 64-bit
#Include Win32Struct.ahk
#Include Guid.ahk

#Include ./Windows/Win32/System/Com/Apis.ahk

/**
 * Win32ComInterface is the base class from which all generated COM Interfaces
 * derive.
 *
 * @see https://www.autohotkey.com/docs/v2/lib/ComValue.htm
 */
class Win32ComInterface extends Win32Struct {

    /**
     * If this interface is implemented by the script, refCount contains the
     * reference count. Otherwise, its value is -1
     * @type {Integer}
     */
    refCount := -1

    static sizef := A_PtrSize

    /**
     * Initializes a new `Win32ComInterface` object
     * @param {Integer} ptrOrImpl the interface pointer to wrap, or an object containing
     *          the interface implementation
     * @param {String} callbackCreateFlags if ptrOrImpl is an implementation object, flags
     *          to use when creating the callback addresses. Otherwise, this parameter is
     *          ignored
     */
    __New(ptrOrImpl := 0, callbackCreateFlags := ""){
        if(IsObject(ptrOrImpl)){
            super.__New(0)
            this.owned := true

            this.__vTableBuffer := Buffer(this.FunctionCount() * A_PtrSize, 0)
            this.__vTablePtr := this.__vTableBuffer.ptr

            this.refCount := 0
            this.Implement(ptrOrImpl, callbackCreateFlags)
            ComCall(1, this, "uint")    ; AddRef()
        }
        else{
            this.owned := ptrOrImpl == 0
            super.__New(Integer(ptrOrImpl))
        }
    }

    /**
     * Construct the interface's virtual function table. Functions are mapped
     * from the provided `implObj` to the vtable based on their names. Signatures
     * must match exactly.
     *
     * @param {Object} implObj an object containing the interface implementation's
     *          methods. Methods are mapped using GetMethod. The object must implement
     *          every function in the interface and all interfaces it extends, except
     *          IUnknown, for which default implementations are provided.
     * @param {String} callbackCreateFlags flags to use when creating the callback addresses
     */
    Implement(implObj, callbackCreateFlags){
        if(this.base == Win32ComInterface){
            throw TypeError("This method cannot be used by Win32ComInterface directly", -1)
        }

        if(!this.owned){
            throw Error("Cannot implement an unowned interface instance")
        }

        OutputDebug(Format("AhkWin32: Implementing {1}@0x{2:X} with {3}@0x{4:X}`n",
            Type(this), ObjPtr(this), Type(implObj), ObjPtr(implObj)))

        ; Special handling for IUnknown methods since we have defaults when the caller doesn't override them
        for(i, fnName in ["QueryInterface", "AddRef", "Release"]) {
            minParams := fnName == "QueryInterface" ? 3 : 1

            fn := implObj.HasMethod(fnName, minParams) ?
                DebugTrace.Bind("IUnknown", fnName, Type(implObj), ObjPtr(implObj), ObjBindMethod(implObj, fnName)) :
                DebugTrace.Bind("IUnknown", fnName, Type(this), ObjPtr(this), ObjBindMethod(this, "__Default" fnName))

            addr := CallbackCreate(fn, callbackCreateFlags, minParams)
            this.__vTable[i] := addr
        }

        iFace := Win32Struct.ResolveClassName(this.__Class)
        while((iFaceName := iFace.Prototype.__Class) != "IUnknown"){
            for(i, fnName in iFace.VTableNames){
                paramCount := GetMethod(iFace.Prototype, fnName).MinParams

                ; Note MinParams is unreliable because it varies between fat arrow functions and methods
                if(!HasMethod(implObj, fnName)) {
                    msg := Format("Cannot implement '{1}' using object of type '{2}': missing method '{3}::{4}'",
                        type(this), type(implObj), iFaceName, fnName)
                    throw MethodError(msg, -2, implObj)
                }

                fn := DebugTrace.Bind(iFaceName, fnName, Type(implObj), ObjPtr(implObj), ObjBindMethod(implObj, fnName))
                addr := CallbackCreate(fn, callbackCreateFlags, paramCount)
                this.__vTable[i + iFace.vTableOffset] := addr
            }

            iFace := iFace.base
        }

        DebugTrace(ifaceName, fnName, implName, implPtr, fn, params*) => (
            OutputDebug(Format("AhkWin32: {1}::{2} (impl by {3}@0x{4:X}) invoked through vtable callback`n",
                ifaceName, fnName, implName, implPtr)),
            fn(params*)
        )
    }

    /**
     * Counts the total number of functions implemented by this interface and
     * all interfaces it extends
     * @returns {Integer} the number of functions implemented
     */
    FunctionCount(){
        count := 0
        obj := Win32Struct.ResolveClassName(this.__Class)
        while(obj.Prototype.__Class != "Win32ComInterface"){
            count += obj.VTableNames.Length
            obj := obj.base
        }

        return count
    }

    /**
     * A pointer to the interface's virtual funciton table. Do not set this
     * yourself
     * @type {Integer}
     */
    __vTablePtr{
        get => NumGet(this.ptr, "ptr")
        set => NumPut("ptr", value, this.ptr)
    }
   
    /**
     * The interface's virtual function table. This is an array of function pointers.
     * You should never modify the virtual function table, for any reason. It exists
     * here so that `Implement` can set it up.
     *
     * @type {Win32FixedArray<Pointer>}
     */
    __vTable {
        get{
            if(!this.HasProp("__vTableProxyArray")){
                this.__vTableProxyArray := Win32FixedArray(this.__vTablePtr, this.FunctionCount(), Primitive, "ptr")
            }
            return this.__vTableProxyArray
        }
    }

    /**
     * For AHK-implemented (owned) interfaces, clears the virtual function table. This releases references held in
     * the callbacks, which in turn allows the interface and its implementation object to be freed.
     */
    Dispose() {
        if(!this.owned)
            throw Error("Cannot dispose of an unowned interface", -1)

        if(this.refCount > 1){
            throw MemoryError(Format("Script-owned {1} disposed of with {2} reference(s) remaining", type(this), this.refCount))
        }

        OutputDebug(Format("AhkWin32: Disposing of {1}@0x{2}", Type(this), ObjPtr(this)))

        for(ptr in this.__vTable){
            if(ptr == 0)
                continue

            CallbackFree(ptr)
            this.__vTable[A_Index] := 0
        }
    }

    /**
     * Default QueryInterface implementation. You probably do not need or want to override this
     * @See https://learn.microsoft.com/en-us/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(refiid_void)#remarks
     *
     * @param {Void} _ ignored. Com methods always include a pointer to the object's vTable
     *          as their first parameter. We must account for this but don't care about it
     * @param {Pointer<Guid>} riid a pointer to the Guid of the interface being queried
     * @param {Pointer} comOutPtr pointer to memory location in which to place the address
     *          of the found interface, if any
     */
    __DefaultQueryInterface(_, riid, comOutPtr){
        OutputDebug(Format("AhkWin32: {1} queried for IID {2} with return pointer 0x{3:X}`n",
            Type(this), Guid(riid).ToString(), comOutPtr))

        OK() {
            OutputDebug("AhkWin32: QueryInterface returning S_OK`n")
            NumPut("ptr", this.ptr, comOutPtr)
            ComCall(1, this, "uint")
            return 0
        }

        ; Spec says we must do this if the out pointer is null
        if(comOutPtr == 0){
            OutputDebug("AhkWin32: QueryInterface returning E_POINTER`n")
            return 0x80004003 ; E_POINTER
        }

        ; Allow instances (e.g. parameterized types) to provide their own IID
        if(this.HasProp("IID") && this.IID.Equals(riid)) {
            return OK()
        }

        obj := Win32Struct.ResolveClassName(this.__Class)
        while(obj.Prototype.__Class != "Win32ComInterface"){
            if(obj.IID.Equals(riid)){
                return OK()
            }
            obj := obj.base
        }

        OutputDebug("AhkWin32: QueryInterface returning E_NOINTERFACE`n")

        NumPut("ptr", 0, comOutPtr)
        return 0x80004002 ; E_NOINTERFACE
    }

    __DefaultAddRef(_) {
        OutputDebug(Format("AhkWin32: {1}@0x{2:X} incrementing ref count from {3} -> {4}`n",
            Type(this), ObjPtr(this), this.refCount, this.refCount + 1))
        return ++this.refCount
    }
    __DefaultRelease(_) {
        OutputDebug(Format("AhkWin32: {1}@0x{@:X} decrementing ref count from {3} -> {4}`n",
            Type(this), ObjPtr(this), this.refCount, this.refCount - 1))
        return --this.refCount
    }
}