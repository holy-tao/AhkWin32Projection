#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * IMAPIProgressIUnknown implements a progress object that provides client applications with a progress indicator.
 * @remarks
 * MAPI includes an  _lpProgress_ parameter in many of the methods that perform potentially lengthy operations.  _lpProgress_ points to a client implementation of a progress object. Clients that implement the **IMAPIProgress** interface set this parameter to point to their implementation; clients that do not implement **IMAPIProgress** set the parameter to NULL. To display a progress indicator during processing of the operation, service providers use the progress object supplied by the client, if available, or a MAPI implementation (indicated when  _lpProgress_ is set to NULL).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprogressiunknown
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMAPIProgress extends IUnknown{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Progress", "GetFlags", "GetMax", "GetMin", "SetLimits"]

    /**
     * IMAPIProgressProgress updates the progress indicator with a display of the progress as it is made toward completion of the operation.
     * @param {Integer} ulValue > [in] A number that indicates the current level of progress (calculated from the  _ulCount_ and  _ulTotal_ parameters or from the  _lpulMin_ and  _lpulMax_ parameters of the [IMAPIProgress::SetLimits](imapiprogress-setlimits.md) method) between the global lower limit and the global upper limit.
     * @param {Integer} ulCount > [in] A number that indicates the currently processed item relative to the total.
     * @param {Integer} ulTotal > [in] The total number of items to be processed during the operation.
     * @returns {HRESULT} S_OK 
     *   
     * > The progress indicator was successfully updated.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprogress-progress
     */
    Progress(ulValue, ulCount, ulTotal) {
        result := ComCall(3, this, "uint", ulValue, "uint", ulCount, "uint", ulTotal, "HRESULT")
        return result
    }

    /**
     * IMAPIProgressGetFlags returns flag settings from the progress object for the level of operation on which progress information is calculated.
     * @remarks
     * MAPI enables service providers to differentiate between top-level objects and subobjects with the MAPI_TOP_LEVEL flag so that all objects involved in an operation can use the same [IMAPIProgress](imapiprogressiunknown.md) implementation to show progress. This causes the indicator display to proceed smoothly in a single positive direction. Whether the MAPI_TOP_LEVEL flag is set determines how service providers set the other parameters in subsequent calls to the progress object.
     *   
     * The value returned by **GetFlags** is set initially by the implementer and subsequently by the service provider through a call to the [IMAPIProgress::SetLimits](imapiprogress-setlimits.md) method.
     * @param {Pointer<Integer>} lpulFlags > [out] A bitmask of flags that controls the level of operation on which progress information is calculated. The following flag can be returned:
     * 
     * MAPI_TOP_LEVEL
     *   
     * > Progress is being calculated for the top-level object, the object that is called by the client to begin the operation. For example, the top-level object in a folder copy operation is the folder that is being copied. When MAPI_TOP_LEVEL is not set, progress is calculated for a lower level object, or subobject. In the folder copy operation, a lower level object is one of the subfolders in the folder that is being copied.
     * @returns {HRESULT} S_OK
     *   
     * > The flags value was returned successfully.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprogress-getflags
     */
    GetFlags(lpulFlags) {
        lpulFlagsMarshal := lpulFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, lpulFlagsMarshal, lpulFlags, "HRESULT")
        return result
    }

    /**
     * IMAPIProgressGetMax returns the maximum number of items in the operation for which progress information is displayed.
     * @remarks
     * The maximum value represents the end of the operation in numeric form. The value can be a global maximum value, used to represent the scope of the entire progress display, or a local value, used to represent only a part of the display. 
     *   
     * The value of the flag setting affects whether the progress object understands the maximum value to be local or global. When the MAPI_TOP_LEVEL flag is set, the maximum value is considered to be global and is used to calculate progress for the entire operation. When MAPI_TOP_LEVEL is not set, the maximum value is considered to be local, and providers use it internally to display progress for lower level subobjects. Progress objects save the local maximum value only to return it to a provider through a **GetMax** call. 
     *   
     * For more information about how and when to make calls to a progress object, see [Display a Progress Indicator](how-to-display-a-progress-indicator.md).
     * @param {Pointer<Integer>} lpulMax > [out] A pointer to the maximum number of items in the operation.
     * @returns {HRESULT} S_OK 
     *   
     * > The maximum number of items in the operation has been retrieved.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprogress-getmax
     */
    GetMax(lpulMax) {
        lpulMaxMarshal := lpulMax is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, lpulMaxMarshal, lpulMax, "HRESULT")
        return result
    }

    /**
     * IMAPIProgressGetMin returns the minimum value in the IMAPIProgressSetLimits method for which progress information is displayed.
     * @remarks
     * The minimum value represents the start of the operation in numeric form. The value can be a global maximum value, used to represent the scope of the entire progress display, or a local value, used to represent only a part of the display. 
     *   
     * The value of the flag setting affects whether the progress object understands the minimum value to be local or global. When the MAPI_TOP_LEVEL flag is set, the minimum value is considered to be global and is used to calculate progress for the entire operation. When MAPI_TOP_LEVEL is not set, the minimum value is considered local, and providers use it internally to display progress for lower level subobjects. Progress objects save the local minimum value only to return it to a provider through a **GetMin** call.
     * @param {Pointer<Integer>} lpulMin > [out] A pointer to the minimum number of items in the operation.
     * @returns {HRESULT} S_OK 
     *   
     * > The minimum number of items in the operation has been retrieved.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprogress-getmin
     */
    GetMin(lpulMin) {
        lpulMinMarshal := lpulMin is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, lpulMinMarshal, lpulMin, "HRESULT")
        return result
    }

    /**
     * IMAPIProgressSetLimits sets the limits for the number of items in the operation, and the flags that control how progress information is calculated.
     * @remarks
     * Service providers call the **IMAPIProgress::SetLimits** method to set or clear the MAPI_TOP_LEVEL flag and to set local and global minimum and maximum values. The value of the flag setting affects whether the progress object understands the minimum and maximum values to be local or global. When the MAPI_TOP_LEVEL flag is set, these values are considered global and are used to calculate progress for the entire operation. Progress objects initialize the global minimum value to 1 and the global maximum value to 1000.
     *   
     * When MAPI_TOP_LEVEL is not set, the minimum and maximum values are considered local, and providers use them internally to display progress for lower level subobjects. Progress objects save the local minimum and maximum values only so that they can be returned to providers when the [IMAPIProgress::GetMin](imapiprogress-getmin.md) and [IMAPIProgress::GetMax](imapiprogress-getmax.md) methods are called.
     *   
     * For more information about how to implement **SetLimits** and the other [IMAPIProgress](imapiprogressiunknown.md) methods, see [Implementing a Progress Indicator](implementing-a-progress-indicator.md).
     *   
     * For more information about how and when to make calls to a progress object, see [Display a Progress Indicator](how-to-display-a-progress-indicator.md).
     * @param {Pointer<Integer>} lpulMin > [in] A pointer to a variable that contains the lower limit of items in the operation.
     * @param {Pointer<Integer>} lpulMax > [in] A pointer to a variable that contains the upper limit of items in the operation.
     * @param {Pointer<Integer>} lpulFlags > [in] A bitmask of flags that controls the level of operation on which progress information is calculated. The following flag can be set:
     * 
     * MAPI_TOP_LEVEL
     *   
     * > Uses the values in the [IMAPIProgress::Progress](imapiprogress-progress.md) method's _ulCount_ and _ulTotal_ parameters, which indicate the currently processed item and the total items, respectively, to increment progress on the operation. When this flag is set, the values of the global lower and upper limits have to be set.
     * @returns {HRESULT} S_OK
     *   
     * > The call succeeded and has returned the expected value or values.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprogress-setlimits
     */
    SetLimits(lpulMin, lpulMax, lpulFlags) {
        lpulMinMarshal := lpulMin is VarRef ? "uint*" : "ptr"
        lpulMaxMarshal := lpulMax is VarRef ? "uint*" : "ptr"
        lpulFlagsMarshal := lpulFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, lpulMinMarshal, lpulMin, lpulMaxMarshal, lpulMax, lpulFlagsMarshal, lpulFlags, "HRESULT")
        return result
    }
}
