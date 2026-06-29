#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IDebugHostContext.ahk" { IDebugHostContext }
#Import ".\Location.ahk" { Location }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostMemory extends IUnknown {
    /**
     * The interface identifier for IDebugHostMemory
     * @type {Guid}
     */
    static IID := Guid("{212149c9-9183-4a3e-b00e-4fd1dc95339b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostMemory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ReadBytes                   : IntPtr
        WriteBytes                  : IntPtr
        ReadPointers                : IntPtr
        WritePointers               : IntPtr
        GetDisplayStringForLocation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostMemory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDebugHostContext} _context 
     * @param {Location} _location 
     * @param {Integer} _buffer 
     * @param {Integer} bufferSize 
     * @returns {Integer} 
     */
    ReadBytes(_context, _location, _buffer, bufferSize) {
        result := ComCall(3, this, "ptr", _context, Location, _location, "ptr", _buffer, "uint", bufferSize, "uint*", &bytesRead := 0, "HRESULT")
        return bytesRead
    }

    /**
     * 
     * @param {IDebugHostContext} _context 
     * @param {Location} _location 
     * @param {Integer} _buffer 
     * @param {Integer} bufferSize 
     * @returns {Integer} 
     */
    WriteBytes(_context, _location, _buffer, bufferSize) {
        result := ComCall(4, this, "ptr", _context, Location, _location, "ptr", _buffer, "uint", bufferSize, "uint*", &bytesWritten := 0, "HRESULT")
        return bytesWritten
    }

    /**
     * 
     * @param {IDebugHostContext} _context 
     * @param {Location} _location 
     * @param {Integer} count 
     * @returns {Integer} 
     */
    ReadPointers(_context, _location, count) {
        result := ComCall(5, this, "ptr", _context, Location, _location, "uint", count, "uint*", &pointers := 0, "HRESULT")
        return pointers
    }

    /**
     * 
     * @param {IDebugHostContext} _context 
     * @param {Location} _location 
     * @param {Integer} count 
     * @param {Pointer<Integer>} pointers 
     * @returns {HRESULT} 
     */
    WritePointers(_context, _location, count, pointers) {
        pointersMarshal := pointers is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", _context, Location, _location, "uint", count, pointersMarshal, pointers, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugHostContext} _context 
     * @param {Location} _location 
     * @param {Integer} verbose 
     * @returns {BSTR} 
     */
    GetDisplayStringForLocation(_context, _location, verbose) {
        locationName := BSTR.Owned()
        result := ComCall(7, this, "ptr", _context, Location, _location, "char", verbose, BSTR.Ptr, locationName, "HRESULT")
        return locationName
    }

    Query(iid) {
        if (IDebugHostMemory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReadBytes := CallbackCreate(GetMethod(implObj, "ReadBytes"), flags, 6)
        this.vtbl.WriteBytes := CallbackCreate(GetMethod(implObj, "WriteBytes"), flags, 6)
        this.vtbl.ReadPointers := CallbackCreate(GetMethod(implObj, "ReadPointers"), flags, 5)
        this.vtbl.WritePointers := CallbackCreate(GetMethod(implObj, "WritePointers"), flags, 5)
        this.vtbl.GetDisplayStringForLocation := CallbackCreate(GetMethod(implObj, "GetDisplayStringForLocation"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReadBytes)
        CallbackFree(this.vtbl.WriteBytes)
        CallbackFree(this.vtbl.ReadPointers)
        CallbackFree(this.vtbl.WritePointers)
        CallbackFree(this.vtbl.GetDisplayStringForLocation)
    }
}
