#Requires AutoHotkey v2.0

/**
 * Win32ComInterface is the base class from which all generated COM Interfaces
 * derive. 
 * 
 * @see https://www.autohotkey.com/docs/v2/lib/ComValue.htm
 */
class Win32ComInterface {

    /**
     * Pointer to the beginning of this interface's function table
     * @type {ComValue}
     */
    ptr := unset

    /**
     * Initializes a new `Win32ComInterface` object
     * @param {Integer} ptr the interface pointer to wrap
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
     *          every function in the interface and all interfaces it extends except
     *          IUnknown.
     * @param {String} callbackCreateFlags flags to use when creating the callback addresses
     */
    Implement(implObj, callbackCreateFlags){
        if(this.base == Win32ComInterface){
            throw TypeError("This method cannot be used by Win32ComInterface directly", -1)
        }

        if(!this.owned){
            throw Error("Cannot implement an unowned interface instance")
        }

        ; NOTE: we need to account for C++ calling conventions, which include an implicit "this" as their first parmeters
        this.__vTable[1] := CallbackCreate(ObjBindMethod(this, "__DefaultQueryInterface"), callbackCreateFlags, 3)
        this.__vTable[2] := CallbackCreate(ObjBindMethod(this, "__DefaultAddRef"), callbackCreateFlags, 1)
        this.__vTable[3] := CallbackCreate(ObjBindMethod(this, "__DefaultRelease"), callbackCreateFlags, 1)

        iFace := Win32Struct.ResolveClassName(this.__Class)
        while((iFaceName := iFace.Prototype.__Class) != "IUnknown"){
            for(i, fnName in iFace.VTableNames){
                paramCount := GetMethod(iFace.Prototype, fnName).MinParams
                fnImpl := GetMethod(implObj, fnName)
                
                addr := CallbackCreate(fnImpl.Bind(implObj), callbackCreateFlags, paramCount)

                this.__vTable[i + iFace.vTableOffset] := addr
            }

            iFace := iFace.base
        }
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

    __Delete(){
        ; If this is a user-implemented interface, clear the virtual function table
        if(this.owned){
            if(this.refCount > 0){
                throw MemoryError("Interface implementation object released with references remaining", , this.refCount)
            }

            MsgBox(A_ThisFunc . " called for " . type(this))

            for(ptr in this.__vTable){
                CallbackFree(ptr)
            }
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
        ; These don't seem to be defined in any enums or as constants anywhere...
        ; See https://learn.microsoft.com/en-us/windows/win32/com/error-handling-strategies
        static E_NOINTERFACE := 0x80004002, E_POINTER := 0x80004003, S_OK := 0

        ; Spec says we must do this if the out pointer is null
        if(comOutPtr == 0){
            return E_POINTER
        }

        obj := Win32Struct.ResolveClassName(this.__Class)
        while(obj.Prototype.__Class != "Win32ComInterface"){
            if(obj.IID.Equals(riid)){
                NumPut("ptr", this.ptr, comOutPtr)
                ComCall(1, this, "uint")    ; Call AddRef()
                return S_OK
            }

            obj := obj.base
        }

        return E_NOINTERFACE
    }

    __DefaultAddRef(_) => ++this.refCount
    __DefaultRelease(_) => --this.refCount
}