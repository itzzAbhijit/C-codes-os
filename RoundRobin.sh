// 6. Round Robin Scheduling

#include <stdio.h>

#define MAX_PROCESSES 5

void roundRobin(int bt[], int n, int quantum)
{
    int wt[MAX_PROCESSES], tat[MAX_PROCESSES];
    int remaining_bt[MAX_PROCESSES];

    for (int i = 0; i < n; i++)
        remaining_bt[i] = bt[i];

    int time = 0;

    while (1)
    {
        int done = 1;

        for (int i = 0; i < n; i++)
        {
            if (remaining_bt[i] > 0)
            {
                done = 0;

                if (remaining_bt[i] > quantum)
                {
                    time += quantum;
                    remaining_bt[i] -= quantum;
                }
                else
                {
                    time += remaining_bt[i];
                    tat[i] = time;
                    wt[i] = tat[i] - bt[i];
                    remaining_bt[i] = 0;
                }
            }
        }

        if (done == 1)
            break;
    }

    printf("Process\tBurst Time\tWaiting Time\tTurnaround Time\n");
    for (int i = 0; i < n; i++)
        printf("%d\t%d\t\t%d\t\t%d\n", i + 1, bt[i], wt[i], tat[i]);
}

int main()
{
    int bt[MAX_PROCESSES] = {5, 9, 6, 8, 2};
    int n = 5, quantum = 3;

    roundRobin(bt, n, quantum);

    return 0;
}
