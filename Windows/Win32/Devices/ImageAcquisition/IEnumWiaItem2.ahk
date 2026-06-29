#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IWiaItem2.ahk" { IWiaItem2 }

/**
 * Used by applications to enumerate IWiaItem2 objects in the item tree's current folder.
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-ienumwiaitem2
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct IEnumWiaItem2 extends IUnknown {
    /**
     * The interface identifier for IEnumWiaItem2
     * @type {Guid}
     */
    static IID := Guid("{59970af4-cd0d-44d9-ab24-52295630e582}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumWiaItem2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next     : IntPtr
        Skip     : IntPtr
        Reset    : IntPtr
        Clone    : IntPtr
        GetCount : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumWiaItem2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Fills an array of pointers to IWiaItem2 interfaces.
     * @remarks
     * The Windows Image Acquisition (WIA) 2.0 run-time system represents WIA 2.0 hardware devices as a hierarchical tree of [**IWiaItem2**](-wia-iwiaitem2.md) objects. Applications use the **IEnumWiaItem2::Next** method to obtain an **IWiaItem2** interface pointer for each item in the current folder of a hardware device's **IWiaItem2** object tree.
     * 
     * To obtain the list of pointers, the application passes an array of [**IWiaItem2**](-wia-iwiaitem2.md) interface pointers that it allocates. It also passes the number of array elements in the parameter *cElt*. The **IEnumWiaItem2::Next** method fills the array with pointers to **IWiaItem2** interfaces.
     * 
     * Until the enumeration process completes, the **IEnumWiaItem2::Next** method returns S\_OK. Each time it does, it sets the value pointed to by *pcEltFetched* to the number of items it inserted into the array. When **IEnumWiaItem2::Next** finishes the process of enumerating [**IWiaItem2**](-wia-iwiaitem2.md) objects, it returns S\_FALSE and sets the memory location pointed to by *pcEltFetched* to zero.
     * 
     * Applications must call the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method on the interface pointers they receive through the *ppIWiaItem2* parameter.
     * @param {Integer} cElt Type: **ULONG**
     * 
     * Specifies the number of array elements in the array indicated by the *ppIWiaItem2* parameter.
     * @param {Pointer<Integer>} pcEltFetched Type: **ULONG\***
     * 
     * On output, this parameter receives the number of interface pointers actually stored in the array indicated by the *ppIWiaItem2* parameter. When the enumeration is complete, this parameter contains zero.
     * @returns {IWiaItem2} Type: **[**IWiaItem2**](-wia-iwiaitem2.md)\*\***
     * 
     * Receives the address of an array of [**IWiaItem2**](-wia-iwiaitem2.md) interface pointers. **IEnumWiaItem2::Next** fills this array with interface pointers.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-ienumwiaitem2-next
     */
    Next(cElt, pcEltFetched) {
        pcEltFetchedMarshal := pcEltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cElt, "ptr*", &ppIWiaItem2 := 0, pcEltFetchedMarshal, pcEltFetched, "HRESULT")
        return IWiaItem2(ppIWiaItem2)
    }

    /**
     * Skips the specified number of items during an enumeration of available IWiaItem2 objects.
     * @param {Integer} cElt Type: **ULONG**
     * 
     * Specifies the number of items to skip.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-ienumwiaitem2-skip
     */
    Skip(cElt) {
        result := ComCall(4, this, "uint", cElt, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration reference to the first IWiaItem2 object.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-ienumwiaitem2-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates an additional instance of the IEnumWiaItem2 interface and sends back a pointer to it.
     * @remarks
     * Applications must call the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method on the interface pointers they receive through the *ppIEnum* parameter.
     * @returns {IEnumWiaItem2} Type: **[**IEnumWiaItem2**](-wia-ienumwiaitem2.md)\*\***
     * 
     * Receives the address of the [**IEnumWiaItem2**](-wia-ienumwiaitem2.md) interface instance that **IEnumWiaItem2::Clone** creates.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-ienumwiaitem2-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppIEnum := 0, "HRESULT")
        return IEnumWiaItem2(ppIEnum)
    }

    /**
     * Returns the number of elements stored by this enumerator.
     * @returns {Integer} Type: **ULONG\***
     * 
     * Receives a pointer to a **ULONG** that receives the number of elements in the enumeration.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-ienumwiaitem2-getcount
     */
    GetCount() {
        result := ComCall(7, this, "uint*", &cElt := 0, "HRESULT")
        return cElt
    }

    Query(iid) {
        if (IEnumWiaItem2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Clone)
        CallbackFree(this.vtbl.GetCount)
    }
}
