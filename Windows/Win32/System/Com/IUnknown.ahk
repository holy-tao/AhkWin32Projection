#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Enables clients to get pointers to other interfaces on a given object through the QueryInterface method, and manage the existence of the object through the AddRef and Release methods.
 * @see https://docs.microsoft.com/windows/win32/api//unknwn/nn-unknwn-iunknown
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IUnknown extends Win32ComInterface{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUnknown
     * @type {Guid}
     */
    static IID => Guid("{00000000-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryInterface", "AddRef", "Release"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(refiid_void)
     */
    QueryInterface(riid, ppvObject) {
        ppvObjectMarshal := ppvObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(0, this, "ptr", riid, ppvObjectMarshal, ppvObject, "int")
        return result
    }

    /**
     * Increments the reference count for an interface pointer to a COM object. You should call this method whenever you make a copy of an interface pointer.
     * @returns {Integer} The method returns the new reference count. This value is intended to be used only for test purposes.
     * @see https://docs.microsoft.com/windows/win32/api//unknwn/nf-unknwn-iunknown-addref
     */
    AddRef() {
        result := ComCall(1, this, "uint")
        return result
    }

    /**
     * Decrements the reference count for an interface on a COM object.
     * @returns {Integer} The method returns the new reference count. This value is intended to be used only for test purposes.
     * @see https://docs.microsoft.com/windows/win32/api//unknwn/nf-unknwn-iunknown-release
     */
    Release() {
        result := ComCall(2, this, "uint")
        return result
    }

    /**
     * Determines whether or not this interface and some other interface refer to the
     * same underlying object by comparing the pointers retrieved from QueryInterface
     * @param {IUnknown | ComObject} other the interface to compare this one to. If 
     *          other is a native AHK ComObject, its IUnknown pointer is retrieved via
     *          `ComObjQuery`
     * @returns 1 if this and other refer to the same object, 0 if they don't
     */
    Equals(other){
        if(!(other is IUnknown || other is ComObject)){
            throw TypeError("Expected a Win32ComInterface extending IUnknown or a ComObject, but got a(n) " . type(other))
        }
    
        thisPtrBuf := Buffer(A_PtrSize)
        this.QueryInterface(IUnknown.IID, thisPtrBuf)
        thisPtr := NumGet(thisPtrBuf, "ptr")
        
        otherPtr := 0
    
        if(other is IUnknown){
            other.QueryInterface(IUnknown.IID, &otherPtr)
            otherInterface := IUnknown(otherPtr)  ; This object will release the pointer when it falls out of scope
        }
        else{
            ;Native AHK ComObject, use ComObjQuery
            otherPtr := ComObjQuery(other, String(IUnknown.IID)).ptr
        }
    
        return thisPtr == otherPtr
    }
    
    __Delete(){
        if(!this.owned){
            this.Release()
        }
    }
}
