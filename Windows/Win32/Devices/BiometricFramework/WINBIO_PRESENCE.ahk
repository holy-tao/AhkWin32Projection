#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_IDENTITY.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\POINT.ahk
#Include .\WINBIO_PRESENCE_PROPERTIES.ahk

/**
 * Contains information about the presence of an individual whose presence is being monitored.
 * @remarks
 * The [**EngineAdapterIdentifyAll**](/windows/desktop/api/Winbio_adapter/nc-winbio_adapter-pibio_engine_identify_all_fn) function creates an array of **WINBIO\_PRESENCE** structures and sends this array to the biometric service. The biometric service uses the array to update its internal model of humans near the computer.
  * 
  * Depending on the results of this update, the biometric service may generate a [**WINBIO\_ASYNC\_RESULT**](/windows/desktop/api/Winbio/ns-winbio-winbio_async_result) structure for the [**WinBioMonitorPresence**](/windows/desktop/api/winbio/nf-winbio-winbiomonitorpresence) function for any clients with active presence monitors. The **WINBIO\_ASYNC\_RESULT.Operation** member of the structure contains **WINBIO\_OPERATION\_MONITOR\_PRESENCE**, and the **WINBIO\_ASYNC\_RESULT.Parameters.MonitorPresence.ChangeType** member provides additional information about the state of the individual.
  * 
  * When an individual that the engine adapter associates with a particular tracking identifier appears in the input stream for the first time, the biometric service generates a client-side [**WINBIO\_ASYNC\_RESULT**](/windows/desktop/api/Winbio/ns-winbio-winbio_async_result) structure where the **WINBIO\_ASYNC\_RESULT.Parameters.MonitorPresence.ChangeType** member is **WINBIO\_CHANGE\_TYPE\_ARRIVAL**. This structure is sent to your application callback function or application message queue before any other **WINBIO\_ASYNC\_RESULT** structures where the **WINBIO\_ASYNC\_RESULT.Parameters.MonitorPresence.PresenceArray** includes a **WINBIO\_PRESENCE** structure with the same value for **WINBIO\_PRESENCE.TrackingId**.
  * 
  * The following combinations of values in the array of **WINBIO\_PRESENCE** structures that the **WINBIO\_ASYNC\_RESULT.Parameters.MonitorPresence.PresenceArray** member indicate specific kinds of changes in the state of an individual.
  * 
  * -   When an individual is visible in the camera frame, but the engine is still trying to identify the individual, the members of the **WINBIO\_PRESENCE** structure have the values in the following table.
  * 
  *     
  * 
  *     | Member            | Value                                                    |
  *     |-------------------|----------------------------------------------------------|
  *     | **TrackingId**    | An integer that identifies the individual to the engine. |
  *     | **Status**        | **S\_OK**                                                |
  *     | **Identity.Type** | **WINBIO\_ID\_TYPE\_NULL**                               |
  * 
  *     
  * 
  *      
  * 
  *     In this case, the biometric service extends the expiry time for the individual, and does not generate a client-side [**WINBIO\_ASYNC\_RESULT**](/windows/desktop/api/Winbio/ns-winbio-winbio_async_result) structure for the tracking identifier where the **WINBIO\_ASYNC\_RESULT.Parameters.MonitorPresence.ChangeType** member is **WINBIO\_CHANGE\_TYPE\_RECOGNIZE**.
  * 
  *     The first time that a [**WINBIO\_ASYNC\_RESULT**](/windows/desktop/api/Winbio/ns-winbio-winbio_async_result) structure includes **WINBIO\_PRESENCE** structure where the **Status** member is **S\_OK** and the **Identity.Type** member is **WINBIO\_ID\_TYPE\_NULL** after one or more **WINBIO\_ASYNC\_RESULT** structures included a **WINBIO\_PRESENCE** structure with a **Status** member of **WINBIO\_E\_BAD\_CAPTURE**, the presence monitor generates a single **WINBIO\_ASYNC\_RESULT** structure for the tracking identifier where the **WINBIO\_ASYNC\_RESULT.Parameters.MonitorPresence.ChangeType** member is **WINBIO\_CHANGE\_TYPE\_TRACK**. This **WINBIO\_ASYNC\_RESULT** structure where the **WINBIO\_ASYNC\_RESULT.Parameters.MonitorPresence.ChangeType** member is **WINBIO\_CHANGE\_TYPE\_TRACK** informs the client that the problem that caused the **WINBIO\_E\_BAD\_CAPTURE** error has resolved. For more information about the circumstances where a **WINBIO\_PRESENCE** structure has **Status** member of **WINBIO\_E\_BAD\_CAPTURE**, see the description about how the engine adapter provides feedback to the user to correct recognition failures later in these Remarks.
  * 
  * -   When an individual is visible in the camera frame, but the engine is still trying to identify the individual and wants to provide feedback to the user about how to correct a recognition failure, the members of the **WINBIO\_PRESENCE** structure have the values in the following table.
  * 
  *     
  * 
  *     | Member                                                                                                      | Value                                                                         |
  *     |-------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------|
  *     | **TrackingId**                                                                                              | An integer that identifies the individual to the engine.                      |
  *     | **Status**                                                                                                  | **WINBIO\_E\_BAD\_CAPTURE**                                                   |
  *     | **Identity.Type**                                                                                           | **WINBIO\_ID\_TYPE\_NULL**                                                    |
  *     | **Properties.FacialFeatures.BoundingBox**, if the value of **Factor** is **WINBIO\_TYPE\_FACIAL\_FEATURES** | The location of the face of the individual within the camera frame.           |
  *     | **Properties.Iris.BoundingBox**, if the value of **Factor** is **WINBIO\_TYPE\_IRIS**                       | The location of the iris or irises of the individual within the camera frame. |
  * 
  *     
  * 
  *      
  * 
  *     In this case, the biometric service extends the expiry time for for the individual and generates a [**WINBIO\_ASYNC\_RESULT**](/windows/desktop/api/Winbio/ns-winbio-winbio_async_result) structure for the tracking identifier where the **WINBIO\_ASYNC\_RESULT.Parameters.MonitorPresence.ChangeType** member is **WINBIO\_CHANGE\_TYPE\_TRACK**.
  * 
  * -   When an individual is visible in the camera frame, and the engine adapter determines the identity of the individual, the members of the **WINBIO\_PRESENCE** structure have the values in the following table.
  * 
  *     
  * 
  *     | Member                        | Value                                                    |
  *     |-------------------------------|----------------------------------------------------------|
  *     | **TrackingId**                | An integer that identifies the individual to the engine. |
  *     | **Status**                    | **S\_OK**                                                |
  *     | **Identity.Type**             | **WINBIO\_ID\_TYPE\_SID**                                |
  *     | **Identity.Value.AccountSid** | The security identifier (SID) of the individual.         |
  * 
  *     
  * 
  *      
  * 
  *     In this case, the biometric service associates the tracking identifier with the SID for the individual and generates a client-side [**WINBIO\_ASYNC\_RESULT**](/windows/desktop/api/Winbio/ns-winbio-winbio_async_result) structure for the tracking identifier where the **WINBIO\_ASYNC\_RESULT.Parameters.MonitorPresence.ChangeType** member is **WINBIO\_CHANGE\_TYPE\_RECOGNIZE**. The biometric service does not generate additional client-side **WINBIO\_ASYNC\_RESULT** structures for the tracking identifier unless the individual leaves the camera frame.
  * 
  * -   When an individual is visible in the camera frame, but the engine adapter determines for certain that the individual is not enrolled, the members of the **WINBIO\_PRESENCE** structure have the values in the following table.
  * 
  *     
  * 
  *     | Member            | Value                                                    |
  *     |-------------------|----------------------------------------------------------|
  *     | **TrackingId**    | An integer that identifies the individual to the engine. |
  *     | **Status**        | **WINBIO\_E\_UNKNOWN\_ID**                               |
  *     | **Identity.Type** | **WINBIO\_ID\_TYPE\_NULL**                               |
  * 
  *     
  * 
  *      
  * 
  *     In this case, the biometric service associates the tracking identifier of the individual with an identity of UNKNOWN, and generates a client-side [**WINBIO\_ASYNC\_RESULT**](/windows/desktop/api/Winbio/ns-winbio-winbio_async_result) structure for the tracking identifier where the **WINBIO\_ASYNC\_RESULT.Parameters.MonitorPresence.ChangeType** member is **WINBIO\_CHANGE\_TYPE\_RECOGNIZE**. The biometric service does not generate additional client-side **WINBIO\_ASYNC\_RESULT** structures for the tracking identifier unless the individual leaves the camera frame.
  * 
  * When an individual that the engine adapter associates with a particular tracking identifier leaves the camera frame and stops appearing in the values that the [**EngineAdapterIdentifyAll**](/windows/desktop/api/Winbio_adapter/nc-winbio_adapter-pibio_engine_identify_all_fn) function returns, the tracking identifier eventually expires. When the tracking identifier expires, the biometric service generates a client-side [**WINBIO\_ASYNC\_RESULT**](/windows/desktop/api/Winbio/ns-winbio-winbio_async_result) structure where the **WINBIO\_ASYNC\_RESULT.Parameters.MonitorPresence.ChangeType** member is **WINBIO\_CHANGE\_TYPE\_DEPART**. The engine adapter can prevent the biometric service from generating this structure with the **WINBIO\_CHANGE\_TYPE\_DEPART** value by including a **WINBIO\_PRESENCE** structure in the array that **EngineAdapterIdentifyAll** returns, where the **WINBIO\_PRESENCE.Status** member is **S\_OK** and the **WINBIO\_PRESENCE.Identity.Type** member is **WINBIO\_ID\_TYPE\_NULL** as described earlier in these Remarks. This action extends the expiry time for the tracking identifier without causing any client-side activity.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-presence
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_PRESENCE extends Win32Struct
{
    static sizeof => 480

    static packingSize => 8

    /**
     * The biometric factor used to monitor the presence of the individual.
     * @type {Integer}
     */
    Factor {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The biometric subfactor qualifier for the biometric factor used to monitor the presence of the individual.
     * @type {Integer}
     */
    SubFactor {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * The status of the identification procedure for the individual.
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Additional information about the failure to recognize an individual, including feedback that explains how to correct the failure.
     * @type {Integer}
     */
    RejectDetail {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The identity of the individual whose presence is being monitored, once that individual has been identified.
     * @type {WINBIO_IDENTITY}
     */
    Identity{
        get {
            if(!this.HasProp("__Identity"))
                this.__Identity := WINBIO_IDENTITY(this.ptr + 16)
            return this.__Identity
        }
    }

    /**
     * An integer that is generated by the adapter and uniquely identifies the individual. The tracking identifier that the adapter assigns to a particular individual is guaranteed to be constant as long as that person remains in the camera frame.
     * @type {Integer}
     */
    TrackingId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved. Set to 0 by the adapter.
     * @type {Integer}
     */
    Ticket {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Factor-specific information about the position of an individual.
     * @type {WINBIO_PRESENCE_PROPERTIES}
     */
    Properties{
        get {
            if(!this.HasProp("__Properties"))
                this.__Properties := WINBIO_PRESENCE_PROPERTIES(this.ptr + 40)
            return this.__Properties
        }
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 440, "uint")
        set => NumPut("uint", value, this, 440)
    }

    /**
     * @type {Array<Byte>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 444, 32, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}
