#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITaskNamedValueCollection.ahk
#Include .\ITrigger.ahk

/**
 * Represents a trigger that starts a task when a system event occurs.
 * @remarks
 * 
 * A maximum of 500 tasks with event subscriptions can be created. An event subscription that queries for a variety of events can be used to trigger a task that uses the same action in response to the events being logged.
 * 
 * When reading or writing your own XML for a task, an event trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-eventtrigger-triggergroup-element">EventTrigger</a> element of the Task Scheduler schema.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-ieventtrigger
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IEventTrigger extends ITrigger{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEventTrigger
     * @type {Guid}
     */
    static IID => Guid("{d45b0167-9653-4eef-b94f-0732ca7af251}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Subscription", "put_Subscription", "get_Delay", "put_Delay", "get_ValueQueries", "put_ValueQueries"]

    /**
     */
    Subscription {
        get => this.get_Subscription()
        set => this.put_Subscription(value)
    }

    /**
     */
    Delay {
        get => this.get_Delay()
        set => this.put_Delay(value)
    }

    /**
     * @type {ITaskNamedValueCollection} 
     */
    ValueQueries {
        get => this.get_ValueQueries()
        set => this.put_ValueQueries(value)
    }

    /**
     * Gets or sets a query string that identifies the event that fires the trigger.
     * @remarks
     * 
     * When reading or writing your own XML for a task, the event subscription is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-subscription-eventtriggertype-element">Subscription</a> element of the Task Scheduler schema.
     * 
     * For more information about writing a query string for certain events, see <a href="https://docs.microsoft.com/previous-versions//aa385231(v=vs.85)">Event Selection</a> and <a href="https://docs.microsoft.com/windows/win32/wes/subscribing-to-events">Subscribing to Events</a>.
     * 
     * 
     * 
     * @param {Pointer<BSTR>} pQuery 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-ieventtrigger-get_subscription
     */
    get_Subscription(pQuery) {
        result := ComCall(20, this, "ptr", pQuery, "HRESULT")
        return result
    }

    /**
     * Gets or sets a query string that identifies the event that fires the trigger.
     * @remarks
     * 
     * When reading or writing your own XML for a task, the event subscription is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-subscription-eventtriggertype-element">Subscription</a> element of the Task Scheduler schema.
     * 
     * For more information about writing a query string for certain events, see <a href="https://docs.microsoft.com/previous-versions//aa385231(v=vs.85)">Event Selection</a> and <a href="https://docs.microsoft.com/windows/win32/wes/subscribing-to-events">Subscribing to Events</a>.
     * 
     * 
     * 
     * @param {BSTR} query 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-ieventtrigger-put_subscription
     */
    put_Subscription(query) {
        query := query is String ? BSTR.Alloc(query).Value : query

        result := ComCall(21, this, "ptr", query, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that indicates the amount of time between when the event occurs and when the task is started.
     * @remarks
     * 
     * When reading or writing your own XML for a task, the event delay is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-delay-eventtriggertype-element">Delay</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<BSTR>} pDelay 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-ieventtrigger-get_delay
     */
    get_Delay(pDelay) {
        result := ComCall(22, this, "ptr", pDelay, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that indicates the amount of time between when the event occurs and when the task is started.
     * @remarks
     * 
     * When reading or writing your own XML for a task, the event delay is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-delay-eventtriggertype-element">Delay</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {BSTR} delay 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-ieventtrigger-put_delay
     */
    put_Delay(delay) {
        delay := delay is String ? BSTR.Alloc(delay).Value : delay

        result := ComCall(23, this, "ptr", delay, "HRESULT")
        return result
    }

    /**
     * Gets or sets a collection of named XPath queries. Each query in the collection is applied to the last matching event XML returned from the subscription query specified in the Subscription property.
     * @remarks
     * 
     * The name of the query can be used as a variable in the following action properties:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-ishowmessageaction-get_messagebody">MessageBody property of IShowMessageAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-ishowmessageaction-get_title">Title property of IShowMessageAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iexecaction-get_arguments">Arguments property of IExecAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iexecaction-get_workingdirectory">WorkingDirectory property of IExecAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_server">Server property of IEmailAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_subject">Subject property of IEmailAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_to">To property of IEmailAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_cc">Cc property of IEmailAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_bcc">Bcc property of IEmailAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_replyto">ReplyTo property of IEmailAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_from">From property of IEmailAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_body">Body property of IEmailAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-icomhandleraction-get_data">Data property of IComHandlerAction</a>
     * </li>
     * </ul>
     * 
     * 
     * The following  code example strings show two name-value pairs that can  be used in a name-value collection.
     * The values returned by the XPath queries can replace variables in an action property. The values are referenced by name,  with $(user) and $(machine), in the action property. For example, if the $(user) and $(machine) variables are used in the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-ishowmessageaction-get_messagebody">MessageBody property of IShowMessageAction</a>, then the value of the XPath queries will replace the variables in the string.
     * 
     * <pre class="syntax" xml:space="preserve"><code>name: user
     * value: Event/UserData/SubjectUserName
     * 
     * name: machine
     * value: Event/UserData/MachineName</code></pre>
     * For more information about writing a query string for certain events, see <a href="https://docs.microsoft.com/previous-versions//aa385231(v=vs.85)">Event Selection</a> and <a href="https://docs.microsoft.com/windows/win32/wes/subscribing-to-events">Subscribing to Events</a>.
     * 
     * 
     * @returns {ITaskNamedValueCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-ieventtrigger-get_valuequeries
     */
    get_ValueQueries() {
        result := ComCall(24, this, "ptr*", &ppNamedXPaths := 0, "HRESULT")
        return ITaskNamedValueCollection(ppNamedXPaths)
    }

    /**
     * Gets or sets a collection of named XPath queries. Each query in the collection is applied to the last matching event XML returned from the subscription query specified in the Subscription property.
     * @remarks
     * 
     * The name of the query can be used as a variable in the following action properties:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-ishowmessageaction-get_messagebody">MessageBody property of IShowMessageAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-ishowmessageaction-get_title">Title property of IShowMessageAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iexecaction-get_arguments">Arguments property of IExecAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iexecaction-get_workingdirectory">WorkingDirectory property of IExecAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_server">Server property of IEmailAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_subject">Subject property of IEmailAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_to">To property of IEmailAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_cc">Cc property of IEmailAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_bcc">Bcc property of IEmailAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_replyto">ReplyTo property of IEmailAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_from">From property of IEmailAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iemailaction-get_body">Body property of IEmailAction</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-icomhandleraction-get_data">Data property of IComHandlerAction</a>
     * </li>
     * </ul>
     * 
     * 
     * The following  code example strings show two name-value pairs that can  be used in a name-value collection.
     * The values returned by the XPath queries can replace variables in an action property. The values are referenced by name,  with $(user) and $(machine), in the action property. For example, if the $(user) and $(machine) variables are used in the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-ishowmessageaction-get_messagebody">MessageBody property of IShowMessageAction</a>, then the value of the XPath queries will replace the variables in the string.
     * 
     * <pre class="syntax" xml:space="preserve"><code>name: user
     * value: Event/UserData/SubjectUserName
     * 
     * name: machine
     * value: Event/UserData/MachineName</code></pre>
     * For more information about writing a query string for certain events, see <a href="https://docs.microsoft.com/previous-versions//aa385231(v=vs.85)">Event Selection</a> and <a href="https://docs.microsoft.com/windows/win32/wes/subscribing-to-events">Subscribing to Events</a>.
     * 
     * 
     * @param {ITaskNamedValueCollection} pNamedXPaths 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-ieventtrigger-put_valuequeries
     */
    put_ValueQueries(pNamedXPaths) {
        result := ComCall(25, this, "ptr", pNamedXPaths, "HRESULT")
        return result
    }
}
