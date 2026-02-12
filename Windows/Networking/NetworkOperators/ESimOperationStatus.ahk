#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the status of an [ESimOperationResult](esimoperationresult.md) object.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * >
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimoperationstatus
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ESimOperationStatus extends Win32Enum{

    /**
     * Indicates that the operation was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Indicates that the operation was not authorized.
     * @type {Integer (Int32)}
     */
    static NotAuthorized => 1

    /**
     * Indicates that the specified eSIM profile was not found.
     * @type {Integer (Int32)}
     */
    static NotFound => 2

    /**
     * Indicates that the operation violates policy.
     * @type {Integer (Int32)}
     */
    static PolicyViolation => 3

    /**
     * Indicates that there is not enough storage space on the card to complete the operation.
     * @type {Integer (Int32)}
     */
    static InsufficientSpaceOnCard => 4

    /**
     * Indicates that a server failure occurred during the operation.
     * @type {Integer (Int32)}
     */
    static ServerFailure => 5

    /**
     * Indicates that the server could not be reached during the operation.
     * @type {Integer (Int32)}
     */
    static ServerNotReachable => 6

    /**
     * Indicates that user consent was not granted within the timeout period of the operation.
     * @type {Integer (Int32)}
     */
    static TimeoutWaitingForUserConsent => 7

    /**
     * Indicates that the wrong confirmation code was supplied during the operation.
     * @type {Integer (Int32)}
     */
    static IncorrectConfirmationCode => 8

    /**
     * Indicates that the wrong confirmation code was supplied during the operation, and that no more retries are permitted.
     * @type {Integer (Int32)}
     */
    static ConfirmationCodeMaxRetriesExceeded => 9

    /**
     * Indicates that the SIM card has been removed.
     * @type {Integer (Int32)}
     */
    static CardRemoved => 10

    /**
     * Indicates that the SIM card is busy.
     * @type {Integer (Int32)}
     */
    static CardBusy => 11

    /**
     * Indicates a status that's not accounted for by a more specific status.
     * @type {Integer (Int32)}
     */
    static Other => 12

    /**
     * Indicates that a card error occurred that prevented the download/install/other operation from completing successfully.
     * @type {Integer (Int32)}
     */
    static CardGeneralFailure => 13

    /**
     * Indicates that a confirmation code is needed in order to download the eSIM profile.
     * @type {Integer (Int32)}
     */
    static ConfirmationCodeMissing => 14

    /**
     * Indicates that the matching ID from the activation code or discovered event was refused.
     * @type {Integer (Int32)}
     */
    static InvalidMatchingId => 15

    /**
     * Indicates that an eSIM profile compatible with this device could not be found. For example, a profile was found that requires LTE support, but the device only supports 3G.
     * @type {Integer (Int32)}
     */
    static NoEligibleProfileForThisDevice => 16

    /**
     * Indicates that the operation aborted.
     * @type {Integer (Int32)}
     */
    static OperationAborted => 17

    /**
     * Indicates that an eSIM profile on the mobile operator (MO) server is already allocated for a different eSIM EID than the one the device has.
     * @type {Integer (Int32)}
     */
    static EidMismatch => 18

    /**
     * Indicates that the user is trying to download an eSIM profile that has already been claimed/downloaded.
     * @type {Integer (Int32)}
     */
    static ProfileNotAvailableForNewBinding => 19

    /**
     * Indicates that the eSIM profile is available, but it is not yet marked as released for download by the mobile operator (MO). You can only download a released profile, so the MO needs to mark the profile as released.
     * @type {Integer (Int32)}
     */
    static ProfileNotReleasedByOperator => 20

    /**
     * Indicates that the operation is not allowed for the eSIM profile class.
     * @type {Integer (Int32)}
     */
    static OperationProhibitedByProfileClass => 21

    /**
     * Indicates that an eSIM profile could not be found.
     * @type {Integer (Int32)}
     */
    static ProfileNotPresent => 22

    /**
     * Indicates that no corresponding request could be found.
     * @type {Integer (Int32)}
     */
    static NoCorrespondingRequest => 23

    /**
     * The operation timed out waiting for card response. Suggest that the user try to add the profile again.
     * @type {Integer (Int32)}
     */
    static TimeoutWaitingForResponse => 24

    /**
     * Indicates that the profile couldn't be added because another one with the same ID is already on the eSIM. Suggest that the user contact their mobile operator.
     * @type {Integer (Int32)}
     */
    static IccidAlreadyExists => 25

    /**
     * Indicates that the profile couldn't be added because there was a problem installing it. Suggest that the user contact their mobile operator.
     * @type {Integer (Int32)}
     */
    static ProfileProcessingError => 26

    /**
     * Indicates that the profile couldn't be downloaded because the server isn't a trusted source. Suggest that the user contact their mobile operator.
     * @type {Integer (Int32)}
     */
    static ServerNotTrusted => 27

    /**
     * Indicates that the profile couldn't be added because because it was downloaded too many times. Suggest that the user contact their mobile operator.
     * @type {Integer (Int32)}
     */
    static ProfileDownloadMaxRetriesExceeded => 28
}
