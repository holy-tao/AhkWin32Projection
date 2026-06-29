#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ISensor.ahk" { ISensor }

/**
 * Represents a collection of sensors, such as all the sensors connected to a computer.
 * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nn-sensorsapi-isensorcollection
 * @namespace Windows.Win32.Devices.Sensors
 */
export default struct ISensorCollection extends IUnknown {
    /**
     * The interface identifier for ISensorCollection
     * @type {Guid}
     */
    static IID := Guid("{23571e11-e545-4dd8-a337-b89bf44b10df}")

    /**
     * The class identifier for SensorCollection
     * @type {Guid}
     */
    static CLSID := Guid("{79c43adb-a429-469f-aa39-2f2b74b75937}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISensorCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAt      : IntPtr
        GetCount   : IntPtr
        Add        : IntPtr
        Remove     : IntPtr
        RemoveByID : IntPtr
        Clear      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISensorCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the sensor at the specified index in the collection.
     * @param {Integer} ulIndex <b>ULONG</b> containing the index of the sensor to retrieve.
     * @returns {ISensor} Address of an <a href="https://docs.microsoft.com/windows/desktop/api/sensorsapi/nn-sensorsapi-isensor">ISensor</a> pointer that receives the pointer to the specified sensor.
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensorcollection-getat
     */
    GetAt(ulIndex) {
        result := ComCall(3, this, "uint", ulIndex, "ptr*", &ppSensor := 0, "HRESULT")
        return ISensor(ppSensor)
    }

    /**
     * Retrieves the count of sensors in the collection.
     * @returns {Integer} Address of a <b>ULONG</b> that receives the count.
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensorcollection-getcount
     */
    GetCount() {
        result := ComCall(4, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Adds a sensor to the collection.
     * @param {ISensor} pSensor Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sensorsapi/nn-sensorsapi-isensor">ISensor</a> interface for the sensor to add to the collection.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ALREADY_EXISTS)
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sensor collection already contains a sensor with the specified ID.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensorcollection-add
     */
    Add(pSensor) {
        result := ComCall(5, this, "ptr", pSensor, "HRESULT")
        return result
    }

    /**
     * Removes a sensor from the collection. The sensor is specified by a pointer to the ISensor interface to be removed.
     * @param {ISensor} pSensor Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sensorsapi/nn-sensorsapi-isensor">ISensor</a> interface to remove from the collection.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified sensor is not part of the collection.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensorcollection-remove
     */
    Remove(pSensor) {
        result := ComCall(6, this, "ptr", pSensor, "HRESULT")
        return result
    }

    /**
     * Removes a sensor from the collection. The sensor to be removed is specified by its ID.
     * @param {Pointer<Guid>} sensorID The <b>GUID</b> of the sensor to remove from the collection.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified sensor is not part of the collection.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensorcollection-removebyid
     */
    RemoveByID(sensorID) {
        result := ComCall(7, this, Guid.Ptr, sensorID, "HRESULT")
        return result
    }

    /**
     * Empties the sensor collection.
     * @remarks
     * This method calls <b>Release</b> on all sensor interface pointers in the collection and frees any memory used by the collection.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensorcollection-clear
     */
    Clear() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISensorCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAt := CallbackCreate(GetMethod(implObj, "GetAt"), flags, 3)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.RemoveByID := CallbackCreate(GetMethod(implObj, "RemoveByID"), flags, 2)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAt)
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.RemoveByID)
        CallbackFree(this.vtbl.Clear)
    }
}
