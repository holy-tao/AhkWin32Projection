#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWiaItem2.ahk
#Include .\IEnumWiaItem2.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used by applications to enumerate IWiaItem2 objects in the item tree's current folder.
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-ienumwiaitem2
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IEnumWiaItem2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumWiaItem2
     * @type {Guid}
     */
    static IID => Guid("{59970af4-cd0d-44d9-ab24-52295630e582}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone", "GetCount"]

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
}
