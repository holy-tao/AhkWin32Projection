#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDAComparable)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-ibdacomparable
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IBDAComparable extends IUnknown {
    /**
     * The interface identifier for IBDAComparable
     * @type {Guid}
     */
    static IID := Guid("{b34505e0-2f0e-497b-80bc-d43f3b24ed7f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDAComparable interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CompareExact              : IntPtr
        CompareEquivalent         : IntPtr
        HashExact                 : IntPtr
        HashExactIncremental      : IntPtr
        HashEquivalent            : IntPtr
        HashEquivalentIncremental : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDAComparable.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * This method compares two objects to determine whether they contain the same tuning properties. The first object in the comparison is the object that implements the <b>IBDAComparable</b> interface that the method is called on. The <i>CompareTo</i> parameter specifies the second object.
     * 
     * This method compares all of the tuning properties of the two objects and their associated objects. In contrast, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ibdacomparable-compareequivalent">CompareEquivalent</a> method compares only a subset of these properties.
     * 
     * For example, DirectShow implements the <b>IBDAComparable::CompareExact</b> method for a tune-request object to include both the tuning space and locator in the comparison. Thus, two DVB tuning requests are the same only if they both tune to the same DVB URL (with the same original network ID, transport stream ID, and service ID) <i>and</i> have the same modulation type.
     * @param {IDispatch} CompareTo Pointer to the <b>IDispatch</b> interface of the object that is to be compared with the object that implements the <b>IBDAComparable</b> interface.
     * @returns {Integer} Pointer to a variable that receives the result of the comparison. If the result is 0, the two objects are the same. If the result is nonzero, the two objects are not the same.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ibdacomparable-compareexact
     */
    CompareExact(CompareTo) {
        result := ComCall(3, this, "ptr", CompareTo, "int*", &Result := 0, "HRESULT")
        return Result
    }

    /**
     * The CompareEquivalent method compares two objects to determine whether they contain equivalent tuning information.
     * @remarks
     * This method compares two objects to determine whether they have equivalent tuning properties. The first object in the comparison is the object that implements the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ibdacomparable">IBDAComparable</a> interface that the method is called on. The <i>CompareTo</i> parameter specifies the second object.
     * 
     * To determine whether the two objects contain equivalent tuning information, this method compares a subset of the tuning properties of the two objects and their associated objects. In contrast, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ibdacomparable-compareexact">CompareExact</a> method compares all of these properties.
     * 
     * The tuning information is <i>equivalent</i> if the information in either object tunes to the same content. The implementation of the equivalence comparison depends on the object type.
     * 
     * For example, DirectShow implements the <b>IBDAComparable::CompareEquivalent</b> method for a tune-request object to include the tuning space in the default comparison but not to include the locator. Thus, two DVB tuning requests are equivalent if they both tune to the same DVB URL (with the same original network ID, transport stream ID, and service ID) regardless of whether they have the same modulation type.
     * @param {IDispatch} CompareTo Pointer to the <b>IDispatch</b> interface of the object that is to be compared with the object that implements the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ibdacomparable">IBDAComparable</a> interface.
     * @param {Integer} dwFlags Specifies whether to alter the default equivalence comparison. Setting this parameter to 0 invokes the default behavior. Setting this parameter to the bitwise OR of one or more <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/bda-comp-flags">BDA_Comp_Flags</a> enumeration values overrides the default behavior.
     * @returns {Integer} Receives the result of the comparison. If the result is 0, the two objects are equivalent. If the result is nonzero, the two objects are not equivalent.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ibdacomparable-compareequivalent
     */
    CompareEquivalent(CompareTo, dwFlags) {
        result := ComCall(4, this, "ptr", CompareTo, "uint", dwFlags, "int*", &Result := 0, "HRESULT")
        return Result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * This method generates a hash code from the values of the tuning properties in the object that implements the <b>IBDAComparable</b> interface, and its associated objects.
     * 
     * The caller can compare the resulting hash code to the hash code for another object of the same type to determine whether the two objects contain the same tuning information. The hash code incorporates the tuning properties in the object and its associated objects. If the hash codes for the two objects are identical, the two objects contain the same tuning information.
     * @returns {Integer} Receives the result of the hash operation. This result is the hash code for the tuning properties of the object and its associated objects that are to be included in comparisons with other objects.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ibdacomparable-hashexact
     */
    HashExact() {
        result := ComCall(5, this, "int64*", &Result := 0, "HRESULT")
        return Result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * This method generates a hash code from the values of the tuning properties in the object that implements the <b>IBDAComparable</b> interface, and its associated objects.
     * 
     * Calling this method with a <i>PartialResult</i> value of 0 yields the same result as as calling <b>HashExact</b>.
     * @param {Integer} PartialResult Specifies the intermediate hash code that is to be combined with the hash code that is generated by the method. Typically, this value was generated by a previous call to either <b>HashExactIncremental</b> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ibdacomparable-hashexact">HashExact</a>.
     * @returns {Integer} Receives the result of the hash operation. This result is the hash code for the tuning properties of the object and its associated objects that are to be included in comparisons with other objects.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ibdacomparable-hashexactincremental
     */
    HashExactIncremental(PartialResult) {
        result := ComCall(6, this, "int64", PartialResult, "int64*", &Result := 0, "HRESULT")
        return Result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * This method generates a hash code from a subset of the tuning properties in the object that implements the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ibdacomparable">IBDAComparable</a> interface, and its associated objects.
     * 
     * The caller can compare the resulting hash code to the hash code for another object of the same type to determine whether the two objects contain equivalent tuning information. The hash code incorporates only the subset of properties in the object and its associated objects that is required to determine whether the properties are equivalent to those in another object. If the hash codes for the two objects are identical, the two objects contain equivalent tuning information.
     * @param {Integer} dwFlags Specifies whether to alter the subset of properties that are to be incorporated by default into the hash code. Setting this parameter to 0 invokes the default behavior. Setting this parameter to the bitwise <b>OR</b> of one or more <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/bda-comp-flags">BDA_Comp_Flags</a> enumeration values overrides the default behavior.
     * @returns {Integer} Pointer to a variable that receives the result of the hash operation. This result is the hash code for the subset of the tuning properties of the object and its associated objects that are to be included in comparisons with other objects.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ibdacomparable-hashequivalent
     */
    HashEquivalent(dwFlags) {
        result := ComCall(7, this, "uint", dwFlags, "int64*", &Result := 0, "HRESULT")
        return Result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
     * @remarks
     * This method generates a hash code from a subset of the tuning properties in the object that implements the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ibdacomparable">IBDAComparable</a> interface, and its associated objects.
     * 
     * Calling this method with a <i>PartialResult</i> value of 0 yields the same result as calling <b>HashEquivalent</b>.
     * @param {Integer} PartialResult Specifies the intermediate hash code that is to be combined with the hash code that is generated by the method. Typically, this value was generated by a previous call to either <b>HashEquivalentIncremental</b> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-ibdacomparable-hashequivalent">HashEquivalent</a>.
     * @param {Integer} dwFlags Specifies whether to alter the subset of properties that are to be incorporated by default into the hash code. Setting this parameter to 0 invokes the default behavior. Setting this parameter to the bitwise <b>OR</b> of one or more <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/bda-comp-flags">BDA_Comp_Flags</a> enumeration values overrides the default behavior.
     * @returns {Integer} Pointer to a variable that receives the result of the hash operation. This result is the hash code for the subset of the tuning properties of the object and its associated objects that are to be included in comparisons with other objects.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ibdacomparable-hashequivalentincremental
     */
    HashEquivalentIncremental(PartialResult, dwFlags) {
        result := ComCall(8, this, "int64", PartialResult, "uint", dwFlags, "int64*", &Result := 0, "HRESULT")
        return Result
    }

    Query(iid) {
        if (IBDAComparable.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CompareExact := CallbackCreate(GetMethod(implObj, "CompareExact"), flags, 3)
        this.vtbl.CompareEquivalent := CallbackCreate(GetMethod(implObj, "CompareEquivalent"), flags, 4)
        this.vtbl.HashExact := CallbackCreate(GetMethod(implObj, "HashExact"), flags, 2)
        this.vtbl.HashExactIncremental := CallbackCreate(GetMethod(implObj, "HashExactIncremental"), flags, 3)
        this.vtbl.HashEquivalent := CallbackCreate(GetMethod(implObj, "HashEquivalent"), flags, 3)
        this.vtbl.HashEquivalentIncremental := CallbackCreate(GetMethod(implObj, "HashEquivalentIncremental"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CompareExact)
        CallbackFree(this.vtbl.CompareEquivalent)
        CallbackFree(this.vtbl.HashExact)
        CallbackFree(this.vtbl.HashExactIncremental)
        CallbackFree(this.vtbl.HashEquivalent)
        CallbackFree(this.vtbl.HashEquivalentIncremental)
    }
}
